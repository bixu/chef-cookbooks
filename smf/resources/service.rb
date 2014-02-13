actions :create, :remove
default_action :create

attribute :name, :name_attribute => true

attribute :category, :kind_of => String, :default => 'application'
attribute :cwd, :kind_of => String
attribute :dependencies, :kind_of => Array
attribute :env, :kind_of => Hash
attribute :group, :kind_of => String
attribute :ident, :kind_of => String
attribute :label, :kind_of => String
attribute :privileges, :kind_of => Array
attribute :start, :kind_of => String
attribute :stop, :kind_of => String
attribute :user, :kind_of => String
