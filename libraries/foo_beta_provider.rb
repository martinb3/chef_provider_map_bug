class Chef
  class Provider
    class Foo
      class Beta < Chef::Provider::LWRPBase
        use_inline_resources if defined?(use_inline_resources)

        def whyrun_supported?
          false
        end

        action :execute do
          Chef::Log.warn('Foo(Beta) execute')
        end
      end
    end
  end
end
