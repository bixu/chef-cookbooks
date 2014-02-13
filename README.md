Voxer Chef Cookbooks
====================

Various cookbooks used and created at Voxer for Chef

Installation
------------

To install these cookbooks, drop the following code into a terminal that
is in your chef repo directory

    mkdir -p deps
    git submodule add git://github.com/Voxer/chef-cookbooks.git deps/chef-cookbooks
    if cd cookbooks; then
        for f in ../deps/chef-cookbooks/*/; do
            f=${f%/}
            ln -svf "$f" "${f##*/}"
        done
        cd ..
    fi

Cookbooks
---------

- [npm](npm): Simple, no dependency, node.js package manager LWRP
- [pkgin](pkgin): Simple, no dependency, SmartOS package manager LWRP
- [smf](smf): Simple, single dependency, SMF LWRP

License
-------

MIT License
