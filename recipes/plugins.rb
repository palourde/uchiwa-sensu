#
# Cookbook Name:: uchiwa-sensu
# Recipe:: client
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

git '/etc/sensu/sensu-community-plugins' do
  repository 'https://github.com/sensu/sensu-community-plugins'
  reference 'master'
end

%w(plugins mutators handlers).each do |dir|
  directory "/etc/sensu/#{dir}" do
    action :delete
    not_if { ::File.symlink?("/etc/sensu/#{dir}") }
  end

  link "/etc/sensu/#{dir}" do
    to "/etc/sensu/sensu-community-plugins/#{dir}"
  end
end

directory "/etc/sensu/plugins/uchiwa"
cookbook_file "/etc/sensu/plugins/uchiwa/return.rb" do
  mode 0755
end

