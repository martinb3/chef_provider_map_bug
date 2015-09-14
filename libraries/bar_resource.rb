class Chef
  class Resource
    class Bar < Chef::Resource::LWRPBase
      self.resource_name = :bar
      actions :execute
      default_action :execute
    end
  end
end
