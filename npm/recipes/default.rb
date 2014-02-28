node.run_state[:npm_config_prefix] = `npm config get prefix`.chomp
npm_package 'jsontool'
