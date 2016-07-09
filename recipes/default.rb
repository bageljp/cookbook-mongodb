#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when "centos", "redhat", "amazon"
  yum_repository "mongodb" do
    url "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"
    description "MongoDB Repository"
    gpgcheck false
    enabled false
    action :add
  end

  %W(
    mongodb-org
    mongodb-org-server
  ).each do |pkg|
    package "#{pkg}" do
      action :install
      options "--enablerepo=mongodb"
    end
  end

  template "/etc/mongod.conf" do
    owner "root"
    group "root"
    mode 00644
  end
end

service "mongod" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

