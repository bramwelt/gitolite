#
# Cookbook Name:: gitolite
# Recipe:: default
#
# Copyright (C) 2013 Oregon State University
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

package "gitolite" do
    action :install
end

# Create pubkey file, from users databag
admin_bag = data_bag_item("users", node['gitolite']['admin_user'])

ssh_key = admin_bag["ssh_keys"]
if ssh_key.kind_of?(Array)
    ssh_key = ssh_key.first
end

ssh_key_path = "/tmp/#{node['gitolite']['admin_user']}.pub"

file ssh_key_path do
    content ssh_key
    backup false
    action :create
end

execute "Gitolite Setup" do
    command "gl-setup -q #{ssh_key_path}"
    user "gitolite"
    group "gitolite"
    environment ({'HOME' => '/var/lib/gitolite', 'USER' => 'gitolite'})
    action :run
    not_if "grep #{ssh_key} .ssh/authorized_keys &>/dev/null", :environment => {'HOME' => '/var/lib/gitolite'}
end
