# Directory to store XML manifest files
default[:smf][:manifest_dir] = '/opt/local/share/smf/manifest/chef'

# Directory to cache JSON files for use with smfgen
default[:smf][:json_dir] = "#{default[:smf][:manifest_dir]}/smfgen"
