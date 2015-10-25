#
# Cookbook Name:: uchiwa-sensu
# Recipe:: enterprise
#
# Copyright (C) 2015 Simon Plourde
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
include_recipe 'sensu'

cookbook_file "#{Chef::Config[:file_cache_path]}/sensu-enterprise-#{node['sensu']['enterprise']['version']}.noarch.rpm"

package 'sensu-enterprise' do
  source "#{Chef::Config[:file_cache_path]}/sensu-enterprise-#{node['sensu']['enterprise']['version']}.noarch.rpm"
end

template "/etc/default/sensu-enterprise" do
  cookbook 'sensu'
  source "sensu-enterprise.default.erb"
end

include_recipe 'sensu::rabbitmq'
include_recipe 'sensu::redis'
include_recipe 'sensu::enterprise_service'

include_recipe 'uchiwa-sensu::plugins'
include_recipe 'uchiwa-sensu::checks'
