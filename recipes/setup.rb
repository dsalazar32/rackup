#
# Cookbook Name:: rackup
# Recipe:: setup
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

require 'chef/util/file_edit'

path = [
  "#{node['rackup']['install_path']}/sbin",
  "#{node['rackup']['install_path']}/bin",
  '/usr/local/bin',
  '/usr/local/sbin',
  '/usr/bin',
  '/usr/sbin',
  '/bin',
  '/sbin'
]

file '/etc/profile.d/env.sh' do
  action :create_if_missing
  owner 'root'
  group 'root'
  mode  '0755'
end

ruby_block 'setup environment variables' do
  block do
    file = Chef::Util::FileEdit.new '/etc/profile.d/env.sh'
    match = /PATH/
    value = "PATH=#{path.join(':')}"
    ENV['PATH'] = value.split('=')[1]
    file.search_file_replace_line(match, value)
    file.insert_line_if_no_match(match, value)
    file.write_file
  end
end
