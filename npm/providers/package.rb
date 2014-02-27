action :install do
  # ex: pkg => "jshint@0.0.1"
  pkg = new_resource.name

  _s = pkg.split('@')
  wanted_package = _s[0]
  wanted_version = _s[1]

  installed_version = npm_module_version(wanted_package)
  is_installed = !installed_version.empty?

  execute "Install npm package #{pkg}" do
    command "npm install -g '#{pkg}'"
    not_if { wanted_version.nil? && is_installed }
    only_if { wanted_version != installed_version }
  end
end

action :uninstall do
  pkg = new_resource.name

  installed_version = npm_module_version(pkg)
  is_installed = !installed_version.empty?

  execute "Uninstall npm package #{pkg}" do
    command "npm -g uninstall '#{pkg}'"
    only_if { is_installed }
  end
end
