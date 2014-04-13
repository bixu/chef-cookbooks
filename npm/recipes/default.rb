node.run_state[:npm_config_prefix] = `node -pe 'var path = require("path"); path.dirname(path.dirname(process.execPath));'`.chomp
