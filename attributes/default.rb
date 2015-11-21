default['rackup']['omnibus_pkg_name']     = package_name = "ruby-passenger-nginx"
default['rackup']['install_path']         = install_path = "/opt/#{package_name}/embedded"
default['rackup']['build_iteration']      = "3"
default['rackup']['ruby']['version']      = "2.2.1"
default['rackup']['nginx']['version']     = "1.6.2"
default['rackup']['passenger']['version'] = passenger_version = "5.0.5"

default['nginx']['passenger']['user']      = "deploy"
default['nginx']['passenger']['group']     = "deploy"

override['nginx']['binary']                = "#{install_path}/sbin/nginx"
override['nginx']['src_binary']            = node['nginx']['binary']
override['nginx']['pid']                   = "/var/run/nginx.pid"
override['nginx']['passenger']['ruby']     = "#{install_path}/bin/ruby"
override['nginx']['passenger']['root']     = "#{install_path}/lib/ruby/gems/2.2.0/gems/passenger-#{passenger_version}"
