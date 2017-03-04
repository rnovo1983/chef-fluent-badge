#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'apache::motd'

if node['platform_family'] == "debian"
        package = "apache2"
elseif node['platform_family'] == "rhel"
        package = "httpd"
end

package 'httpserver' do
     package_name package
     action :install
end

service 'apache2' do
    action [:start, :enable]
end
