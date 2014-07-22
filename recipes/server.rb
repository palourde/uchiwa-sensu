#
# Cookbook Name:: uchiwa-sensu
# Recipe:: server
#
# Copyright (C) 2014 Simon Plourde
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
remote_file "#{Chef::Config[:file_cache_path]}/sensu-0.13.0-1.x86_64.rpm" do
  source "https://packagecloud.io/sensu/stable/download?distro=6&filename=sensu-0.13.0-1.x86_64.rpm"
  only_if { node['sensu']['version'] == "0.13.0-1" }
end
rpm_package "#{Chef::Config[:file_cache_path]}/sensu-0.13.0-1.x86_64.rpm" do
  action :install
  only_if { node['sensu']['version'] == "0.13.0-1" }
end

include_recipe "sensu::rabbitmq"
include_recipe "sensu::default"
include_recipe "sensu::redis"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"

include_recipe "uchiwa-sensu::plugins"
include_recipe "uchiwa-sensu::checks"
