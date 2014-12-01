# Encoding: utf-8
#
# Cookbook Name:: stack_commons
# Recipe:: newrelic
#
# Copyright 2014, Rackspace Hosting
#
# Licensed under the newrelic License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.newrelic.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

stackname = node['stack_commons']['stackname']

# The node['newrelic']['license'] attribute needs to be set for NewRelic to work
if node['newrelic']['license']
  node.set[stackname]['newrelic']['application_monitoring'] = 'true'
  node.override['newrelic']['application_monitoring']['daemon']['ssl'] = true
  node.override['newrelic']['server_monitoring']['ssl'] = true
  node.default['newrelic_meetme_plugin']['license'] = node['newrelic']['license']

  if node['stack_commons']['application_monitoring']['php']['enabled'] == true
    include_recipe 'php'  # needed so that we don't install apache by installing the agent
    node.override['newrelic']['php_agent']['agent_action'] = 'upgrade'
    node.default['newrelic']['php_agent']['config_file'] = "#{node['php']['ext_conf_dir']}/newrelic.ini"
    node.default['newrelic']['php_agent']['startup_mode'] = 'external'
    include_recipe 'newrelic::php_agent'
  end
  if node['stack_commons']['application_monitoring']['python']['enabled'] == true
    include_recipe 'newrelic::python_agent'
    include_recipe 'python'
    include_recipe 'python::pip'
    python_pip 'setuptools' do
      action :upgrade
      version node['python']['setuptools_version']
    end
  end
  if node['stack_commons']['application_monitoring']['java']['enabled'] == true
    include_recipe 'newrelic::java_agent'
  end

  # Meetme
  meetme_config = {}
  if node.recipe?('memcached::default')
    meetme_config['memcached'] = {
      name: node['hostname'],
      host: 'localhost',
      port: 11_211
    }
  end

  if node.recipe?('mysql::server')
    # Check if Java is installed
    ohai 'reload' do
      action :reload
    end
    unless node['languages']['java'] && node['languages']['java']['version'].start_with?('1.6', '1.7', '1.8')
      include_recipe 'java'
    end
    # Copy newrelic license key to license_key (newrelic and newrelic_plugins are not using the same attributes)
    node.default['newrelic']['license_key'] = node['newrelic']['license']
    node.default['newrelic']['mysql']['servers'] = [
      {
        name: node.name,
        host: 'localhost',
        metrics: 'status,newrelic',
        mysql_user: node['stack_commons']['cloud_monitoring']['agent_mysql']['user'],
        mysql_passwd: node['stack_commons']['cloud_monitoring']['agent_mysql']['password']
      }
    ]
    # install mysql newrelic plugin
    include_recipe 'newrelic_plugins::mysql'
  end

  if node.recipe?('rabbitmq::default')
    # needs to be run before hand to set attributes (port specifically)
    meetme_config['rabbitmq'] = {
      name: node['hostname'],
      host: 'localhost',
      port: 15_672,
      username: 'monitor',
      password: node['stack_commons']['rabbitmq']['monitor_password'],
      api_path: '/api'
    }
  end

  if node.recipe?('nginx::default')
    template 'nginx-monitor' do
      source 'nginx/sites/monitor.erb'
      path "#{node['nginx']['dir']}/sites-available/monitor.conf"
      owner 'root'
      group 'root'
      mode '0644'
      notifies :reload, 'service[nginx]'
    end

    nginx_site 'monitor.conf' do
      enable true
      notifies :reload, 'service[nginx]'
    end

    meetme_config['nginx'] = {
      name: node['hostname'],
      host: 'localhost',
      port: node['nginx']['status']['port'],
      path: '/server-status'
    }

    nginx_sites = node.deep_fetch(stackname, 'nginx', 'sites')
    if node.recipe?('uwsgi::default') && nginx_sites && !nginx_sites.empty?
      if nginx_sites.values[0]['uwsgi_port']
        meetme_config['uwsgi'] = {
          name: node['hostname'],
          host: 'localhost',
          port: nginx_sites.values[0]['uwsgi_port']
        }        
      else
        Chef::Log.warn('uwsgi was on the runlist, but uwsgi_port was not set on any site')
      end
    end
  end

  if node.recipe?('redisio::enable')
    meetme_config['redis'] = {
      name: node['hostname'],
      host: 'localhost',
      port: node['redis-multi']['bind_port']
    }
  end

  node.override['newrelic_meetme_plugin']['services'] = meetme_config
  node.default['newrelic_meetme_plugin']['package_name'] = 'newrelic-plugin-agent'

  include_recipe 'newrelic_meetme_plugin'
else
  Chef::Log.warn('The New Relic license attribute is not set!')
end
