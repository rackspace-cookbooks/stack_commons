#
# Cookbook Name:: wrapper
# Recipe:: default
#
# Copyright 2014, Rackspace
#
#

# newrelic
node.set['newrelic']['license'] = 'aaaaaaaaaaaaaaaafffaaaaaaaaaaaaaaaaaaaaa'

%w(
  stack_commons::mysql_master
  stack_commons::postgresql_master
  stack_commons::mongodb_standalone
  stack_commons::memcached
  stack_commons::rabbitmq
  stack_commons::varnish
  stack_commons::redis_master
  stack_commons::redis_slave
  stack_commons::redis_sentinel
  nginx
  uwsgi
  stack_commons::newrelic
  elkstack::agent
).each do |recipe|
  include_recipe recipe
end
