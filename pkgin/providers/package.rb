action :install do
  pkg = new_resource.name
  execute "Install SmartOS pkgin package #{pkg}" do
    command "pkgin -y in '#{pkg}'"
    not_if "pkgin ls | grep -q '^#{pkg}'"
  end
end

action :install_if_avail do
  pkg = new_resource.name
  execute "Install SmartOS pkgin package #{pkg}" do
    command "pkgin -y in '#{pkg}'"
    returns [0,1]
    not_if "pkgin ls | grep -q '^#{pkg}'"
  end
end

action :uninstall do
  pkg = new_resource.name
  execute "Uninstall SmartOS pkgin package #{pkg}" do
    command "pkgin -y rm '#{pkg}'"
    only_if "pkgin ls | grep -q '^#{pkg}'"
  end
end
