#
# Cookbook Name:: rackup
# Recipe:: default
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#


execute 'apt-get update'

package_version = [
  node['rackup']['ruby']['version'],
  node['rackup']['passenger']['version'],
  node['rackup']['nginx']['version']]

package 'build-essential'

packagecloud_repo 'dsalazar/iomediums' do
  type 'deb'
end

package node['rackup']['omnibus_pkg_name'] do
  version "#{package_version.join('~')}-#{node['rackup']['build_iteration']}"
end
