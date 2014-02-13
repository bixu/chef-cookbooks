action :install do
  pkg = new_resource.name
  execute "Install npm package #{pkg}" do
    command "npm install -g '#{pkg}'"
    not_if "npm -g ls '#{pkg}' 2> /dev/null | grep -q ' #{pkg}'"
  end
end

action :uninstall do
  pkg = new_resource.name
  execute "Uninstall npm package #{pkg}" do
    command "npm -g uninstall '#{pkg}'"
    only_if "npm -g ls '#{pkg}' 2> /dev/null | grep -q ' #{pkg}'"
  end
end
