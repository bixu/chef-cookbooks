def npm_module_version(pkg)
  `cat '#{node.run_state[:npm_config_prefix]}/lib/node_modules/#{pkg}/package.json' 2>/dev/null | json version`.chomp
end
