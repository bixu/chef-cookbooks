action :create do
  h = new_resource.to_hash

  h[:ident] ||= h[:name]
  h[:start] = {
    :exec => h[:start]
  }

  h[:start][:working_directory] = h[:cwd]          if h[:cwd]        ; h.delete(:cwd)
  h[:start][:user]              = h[:user]         if h[:user]       ; h.delete(:user)
  h[:start][:group]             = h[:group]        if h[:group]      ; h.delete(:group)
  h[:start][:environment]       = h[:env]          if h[:env]        ; h.delete(:env)
  h[:start][:privileges]        = h[:privileges]   if h[:privileges] ; h.delete(:privileges)

  svc = "#{new_resource.category}-#{new_resource.name}"
  json_file = "#{node[:smf][:json_dir]}/#{svc}.json"
  xml_file = "#{node[:smf][:manifest_dir]}/#{svc}.xml"

  # make the JSON file
  d = JSON.pretty_generate(h)
  file json_file do
    content d + "\n"
  end

  # convert the JSON to xml
  execute "Generate SMF Manifest for #{svc}" do
    command "smfgen < '#{json_file}' > '#{xml_file}'"
  end

  # import the XML
  execute "Import SMF Manifest for #{svc}" do
    command "svccfg import '#{xml_file}'"
  end
end


action :remove do
  svc = new_resource.name
  execute "Remove SMF Service #{svc}" do
    command "svccfg delete '#{svc}'"
    only_if "svcs '#{svc}'"
  end
end
