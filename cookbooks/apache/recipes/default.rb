#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['platform_family'] == "debian"
        package = "apache2"
elsif node['platform_family'] == "rhel"
        package = "httpd"
end

package 'httpserver' do
     package_name package
     action :install
end

service 'apache_service' do
     service_name package
    action [:start, :enable]
end
