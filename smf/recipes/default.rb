include_recipe 'npm'
npm_package 'smfgen'

directory node[:smf][:manifest_dir] do
  recursive true
end
directory node[:smf][:json_dir] do
  recursive true
end
