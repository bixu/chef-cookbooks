Description
===========

Simple, no dependency, SmartOS package manager LWRP

Attributes
==========

None

Requirements
============

A node running SmartOS

Usage
=====

``` ruby
pkgin_package 'nginx'
```

equivalent to

    pkgin in nginx

You can also specify a version like

``` ruby
pkgin_package 'nginx-1.5.3'
```

You can try to install a package if it is available, and silently
move on if it is not

``` ruby
pkgin_package 'nginx-1.5.3' do
  action :install_if_avail
end
```

You can remove a package with

``` ruby
pkgin_package 'nginx-1.5.3' do
  action :uninstall
end
```

License
=======

MIT License
