class Chef
  class Provider
    class Foo
      class Alpha < Chef::Provider::LWRPBase
        use_inline_resources if defined?(use_inline_resources)

        def whyrun_supported?
          false
        end

        action :execute do
          Chef::Log.warn('Foo(Alpha) execute')
        end
      end
    end
  end
end
