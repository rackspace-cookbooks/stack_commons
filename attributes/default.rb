# Encoding: utf-8
#
# Cookbook Name:: stack_commons
# Recipe:: default
#
# Copyright 2014, Rackspace, Inc.
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

default['stack_commons']['stackname'] = 'stack_commons'

default['stack_commons']['mysql']['databases'] = {}
default['stack_commons']['rabbitmq']['passwords'] = {}

default['stack_commons']['db-autocreate']['enabled'] = true
default['stack_commons']['varnish']['multi'] = true

# drives logging configurations for the shared functionality
default['logstash_commons']['instance_name'] = 'agent'
default['logstash_commons']['service_name'] = 'agent'
