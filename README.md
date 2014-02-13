Voxer Chef Cookbooks
====================

Various cookbooks used and created at Voxer for Chef

Installation
------------

The following installation guide is highly opinionated, and is what
is done at Voxer to use these cookbooks.

    cd /path/to/your/chef/repo
    mkdir -p deps
    git submodule add git://github.com/Voxer/chef-cookbooks.git deps/chef-cookbooks
    if cd cookbooks; then
        for f in ../deps/chef-cookbooks/*/; do
            ln -svf "$f" "${f##*/}"
        done
    fi

Cookbooks
---------

- [npm](npm): Simple, no dependency, node.js package manager LWRP
- [pkgin](pkgin): Simple, no dependency, SmartOS package manager LWRP
- [smf](smf): Simple, single dependency, SMF LWRP

License
-------

MIT License
