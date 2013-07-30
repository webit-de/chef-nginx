#
# Cookbook Name:: nginx
# Recipe:: default
#

include_recipe 'apt'

apt_repository "nginx" do
  uri "http://nginx.org/packages/#{node[:platform]}/"
  version_name = node[:os_version_name] || value_for_platform(
    "ubuntu" => { "12.04" => "precise" },
    "debian" => { "squeeze" => "squeeze", "wheezy" => "wheezy" }
  )
  components [version_name, "nginx"]
  key "http://nginx.org/packages/keys/nginx_signing.key"
end

package 'nginx'
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  notifies :reload, 'service[nginx]'
end

directory '/etc/nginx/sites-available'
directory '/etc/nginx/sites-enabled'
directory '/etc/nginx/ssl'
%w(nxensite nxdissite).each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode 00755
    owner "root"
    group "root"
  end
end


template "/etc/nginx/conf.d/proxy.conf" do
  source "proxy.conf.erb"
  not_if {'on' != node['nginx']['proxy']}
  notifies :reload, 'service[nginx]'
end

cookbook_file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

