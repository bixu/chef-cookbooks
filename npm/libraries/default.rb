def npm_module_version(pkg)
  `cat "$(npm config get prefix 2>/dev/null)/lib/node_modules/#{pkg}/package.json" 2>/dev/null | json version`.chomp
end
