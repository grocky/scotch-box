include_recipe "apache2"
include_recipe "mysql::server"
include_recipe "database::mysql"

# Update system
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

# Configure prompt
cookbook_file "/home/vagrant/.bash_profile" do
  source "bash_profile"
  owner "vagrant"
  group "vagrant"
  mode "0644"
  action :create_if_missing
end
cookbook_file "/root/.bash_profile" do
  source "bash_profile"
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end