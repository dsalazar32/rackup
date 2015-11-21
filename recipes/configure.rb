#
# Cookbook Name:: rackup
# Recipe:: configure
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx::commons'

cookbook_file "#{node['nginx']['dir']}/mime.types" do
  source 'mime.types'
  owner  'root'
  group  node['root_group']
  mode   '0644'
end

template "#{node['nginx']['dir']}/conf.d/passenger.conf" do
  source 'passenger.conf.erb'
  mode   '0644'
  owner  'root'
  group  node['root_group']
end

include_recipe 'rackup::_service'
