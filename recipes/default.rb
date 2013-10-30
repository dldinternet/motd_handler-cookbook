include_recipe 'chef_handler'

if ::File.exist?("/etc/motd")
  ruby_block "backup /etc/motd" do
   block do
    ::FileUtils.cp "/etc/motd", "/tmp"
   end
  end
end

file "/etc/motd" do
  content node['motd_handler']['in_progress_message']
  mode 0644
  owner "root"
  group "root"
end

template "#{node['chef_handler']['handler_path']}/motd.rb" do
  owner 'root'
  group 'root'
  mode '600'
  source 'motd.rb.erb'
  variables :failure_message => node['motd_handler']['failure_message'] 
end.run_action(:create)

chef_handler "Chef::Handler::Motd" do
  source "#{node['chef_handler']['handler_path']}/motd"
  supports :report => true, :exception => true
  action :enable
end.run_action(:enable)
