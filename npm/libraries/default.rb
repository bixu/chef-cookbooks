def npm_module_version(pkg)
  f = "#{node.run_state[:npm_config_prefix]}/lib/node_modules/#{pkg}/package.json"
  begin
    return JSON.parse(IO.read(f))['version']
  rescue
    return nil
  end
end
