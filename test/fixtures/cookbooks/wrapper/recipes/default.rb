#
# Cookbook Name:: wrapper
# Recipe:: default
#
# Copyright 2014, Rackspace
#
#
%w(
  stack_commons::rabbitmq
).each do |recipe|
  include_recipe recipe
end
