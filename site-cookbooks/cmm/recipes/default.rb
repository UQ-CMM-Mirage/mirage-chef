#
# Cookbook Name:: cmm
# Recipe:: default
#
# Copyright (c) 2012, The University of Queensland
# All rights reserved.

package "rng-tools" do
  action :upgrade
end

cookbook_file "/etc/init/rngd.conf" do
  action :create_if_missing
  source "rngd.conf"
  owner "root"
  group "root"
end

service "rngd" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
