#
# Cookbook Name:: group_management
# Recipe:: administrator_group
#
# Copyright 2011 Junta de Andalucía
#
# Author::
#  * David Amian Valle <damian@emergya.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require 'etc'

members_admin = Etc.getgrnam('admin').mem
group "admin" do
  action :modify
  members node["administrator_group"]["to_add"]
  append true
end
members_admin = members_admin + (node["administrator_group"]["to_add"] - members_admin)
members_admin = members_admin - node["administrator_group"]["to_remove"]

group "admin" do
  action :modify
  members members_admin
  append false
end

