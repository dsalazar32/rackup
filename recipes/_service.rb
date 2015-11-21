include_recipe 'runit::default'

runit_service 'nginx'
service 'nginx' do
  supports       :status => true, :restart => true, :reload => true
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/nginx"
end
