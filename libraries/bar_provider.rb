class Chef
  class Provider
    class Bar < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        false
      end

      action :execute do
        Chef::Log.warn('Bar execute')
      end
    end
  end
end
