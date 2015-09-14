class Chef
  class Resource
    class Foo < Chef::Resource::LWRPBase
      self.resource_name = :foo
      actions :execute
      default_action :execute
    end
  end
end
