include_recipe 'chef_handler'

if ::File.exist?("/etc/motd")
  ruby_block "backup /etc/motd" do
   block do
    ::FileUtils.cp "/etc/motd", "/tmp"
   end
  end
end

cookbook_file "/etc/motd" do
  source "motd.inprogress"
  mode 0644
  owner "root"
  group "root"
end

cookbook_file "#{node['chef_handler']['handler_path']}/motd.rb" do
  source 'motd.rb'
  action :nothing
end.run_action(:create)

chef_handler "Chef::Handler::Motd" do
  source "#{node['chef_handler']['handler_path']}/motd"
  supports :report => true, :exception => true
  action :enable
end.run_action(:enable)
