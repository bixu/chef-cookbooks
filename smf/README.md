Description
===========

Simple, single dependency, SMF LWRP

Requirements
============

1. An [Illumos](http://illumos.org) based Operating System
2. The [npm](../npm) cookbook
3. Node.js installed

This module automatically installs https://github.com/davepacheco/smfgen
to convert JSON => XML for SMF

Attributes
==========

``` ruby
# Directory to store XML manifest files
default[:smf][:manifest_dir] = '/opt/local/share/smf/manifest/chef'

# Directory to cache JSON files for use with smfgen
default[:smf][:json_dir] = "#{default[:smf][:manifest_dir]}/smfgen"
```

Usage
=====

```
include_recipe 'smf'

# Create a basic service
# this will create the SMF XML manifest file, and import it automatically
smf_service 'daves-basic-service' do    # will become svc:/application/daves-basic-service:default
  label 'Daves Basic Service'           # human readable name
  start '/opt/local/bin/some-daemon'    # start script to run, an '&' is appended automatically to background the processes
end

# Create an advanced service
# this will create the SMF XML manifest file, and import it automatically
smf_service 'daves-advanced-service' do # will become svc:/network/daves-advanced-service:default
  label 'Daves Advanced Service'        # human readable name
  start '/var/foo/bar.sh'               # start script to run, an '&' is appended automatically to background the processes
  category 'network'                    # [optional] service category, defaults to 'application'
  cwd '/var/tmp'                        # [optional] processes CWD
  user 'nobody'                         # [optional] user to start the service as
  group 'other'                         # [optional] group to start the service as
  dependencies []                       # [optional] array of service FMRIs that must be online before this service is started
  env ({                                # [optional] environmental variables
    :PATH => '/opt/local/bin:/opt/local/sbin'
  })
end

# Remove the service
smf_service 'daves-test-service' do
  action :remove                    # will issue `svccfg delete daves-test-service` if
                                    # `svcs daves-test-service` returns 0 (the service is found)
                                    # NOTE this will fail if the service is running
end
```

License
=======

MIT License
