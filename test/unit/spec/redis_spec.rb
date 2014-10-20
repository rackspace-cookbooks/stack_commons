# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on stack_commons, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'stack_commons::redis_base' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      # Context for each platform
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
          end.converge('stack_commons::redis_single')
        end

        it 'installs redis' do
          expect(chef_run).to include_recipe('redis-multi')
          expect(chef_run).to include_recipe('redis-multi::enable')
        end
      end

      context 'redis-master' do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
          end.converge('stack_commons::redis_master')
        end

        it 'configures a redis master' do
          expect(chef_run).to include_recipe('redis-multi')
          expect(chef_run).to include_recipe('redis-multi::enable')
        end

      end

      context 'redis-slave' do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
            node.set['redis-multi']['redis_master'] = '127.0.0.1'
          end.converge('stack_commons::redis_slave')
        end

        it 'configures a redis slave' do
          expect(chef_run).to include_recipe('redis-multi')
          expect(chef_run).to include_recipe('redis-multi::enable')
        end

      end

      context 'redis-sentinel' do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
            node.set['redis-multi']['redis_master'] = '127.0.0.1'
          end.converge('stack_commons::redis_sentinel')
        end

        it 'configures a redis sentinel' do
          expect(chef_run).to include_recipe('redis-multi::sentinel')
          expect(chef_run).to include_recipe('redis-multi::sentinel_enable')
        end

      end

      # context for elkstack logging enabled
      context 'with ELKstack logging enabled' do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
            node.set['logstash_commons']['restart_service'] = false # need logstash cookbook to do this
            node.set['platformstack']['elkstack_logging']['enabled'] = true
          end.converge(described_recipe)
        end

        it 'includes logstash_commons::redis' do
          expect(chef_run).to include_recipe('logstash_commons::redis')
        end
      end
    end
  end
end
