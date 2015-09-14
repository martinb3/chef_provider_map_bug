require 'pp'

pp "Chef::Platform.send(:platforms) = #{Chef::Platform.send(:platforms)}"
# Output: "Chef::Platform.send(:platforms) = {:default=>{}}"

pp "Setting platform mapping for :foo"
Chef::Platform.set platform: :centos, version: '< 7.0', resource: :foo, provider: Chef::Provider::Foo::Beta
Chef::Platform.set platform: :centos, version: '>= 7.0', resource: :foo, provider: Chef::Provider::Foo::Alpha
Chef::Platform.set platform: :ubuntu, resource: :foo, provider: Chef::Provider::Foo::Beta
pp "Chef::Platform.send(:platforms) = #{Chef::Platform.send(:platforms)}"
# Output:
# Chef::Platform.send(:platforms) = {
  # :default=>{},
  # :centos=>{\"< 7.0\"=>{:foo=>Chef::Provider::Foo::Beta}, \">= 7.0\"=>{:foo=>Chef::Provider::Foo::Alpha}},
  # :ubuntu=>{:default=>{:foo=>Chef::Provider::Foo::Beta}}
# }

pp "Setting platform mapping for :bar"
Chef::Platform.set platform: :centos, resource: :bar, provider: Chef::Provider::Bar
Chef::Platform.set platform: :ubuntu, resource: :bar, provider: Chef::Provider::Bar
pp "Chef::Platform.send(:platforms) = #{Chef::Platform.send(:platforms)}"
# Output
# Chef::Platform.send(:platforms) = {
  # :default=>{},
  # :centos=>{:default=>{:bar=>Chef::Provider::Bar}},
  # :ubuntu=>{:default=>{:foo=>Chef::Provider::Foo::Beta, :bar=>Chef::Provider::Bar}}
# }
