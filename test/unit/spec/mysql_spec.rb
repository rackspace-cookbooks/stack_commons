# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on stack_commons, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'stack_commons::mysql' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      # Context for each platform
      context "on #{platform.capitalize} #{version}" do
        context 'for mysql v5.6' do
          let(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['mysql-multi']['server_version'] = '5.6'
            end.converge('stack_commons::mysql_base')
          end

          if platform == 'ubuntu' && version == '12.04'
            it 'raises an error' do
              expect { chef_run }.to raise_error
            end
          else
            it 'does not raise an error' do
              expect { chef_run }.to_not raise_error
            end
          end
        end # end mysql v5.6

        context 'for mysql-base' do
          cached(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
            end.converge('stack_commons::mysql_base')
          end

          it 'installs mysql' do
            expect(chef_run).to include_recipe('mysql-multi')
            expect(chef_run).to include_recipe('mysql::server')
          end
        end # end base

        context 'for mysql-master' do
          cached(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
            end.converge('stack_commons::mysql_master')
          end

          it 'configures a mysql master' do
            expect(chef_run).to include_recipe('mysql-multi')
            expect(chef_run).to include_recipe('mysql-multi::mysql_master')
          end
        end # end master

        context 'for mysql-slave' do
          cached(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['mysql-multi']['master'] = '127.0.0.1'
            end.converge('stack_commons::mysql_slave')
          end

          it 'configures a mysql slave' do
            expect(chef_run).to include_recipe('mysql-multi')
            expect(chef_run).to include_recipe('mysql-multi::mysql_slave')
          end
        end # end slave
      end # end context "on #{platform.capitalize} #{version}"
    end # end version
  end # end describe
end
