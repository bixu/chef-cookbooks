action :install do
  # ex: pkg => "jshint@0.0.1"
  pkg = new_resource.name

  _s = pkg.split('@')
  wanted_package = _s[0]
  wanted_version = _s[1]

  installed_version = npm_module_version(wanted_package)

  execute "Install npm package #{pkg}" do
    command "npm install -g '#{pkg}'"
    not_if { wanted_version.nil? && installed_version }
    only_if { !installed_version || wanted_version != installed_version }
  end
end

action :uninstall do
  pkg = new_resource.name

  installed_version = npm_module_version(pkg)

  execute "Uninstall npm package #{pkg}" do
    command "npm -g uninstall '#{pkg}'"
    only_if { installed_version }
  end
end
