# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on stack_commons, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'stack_commons::percona' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        context 'for percona_master' do
          cached(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
            end.converge('stack_commons::percona_master')
          end
          it 'installs percona' do
            expect(chef_run).to include_recipe('percona-multi::master')
          end
        end
        context 'for percona_slave' do
          cached(:chef_run) do
            ChefSpec::ServerRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
            end.converge('stack_commons::percona_slave')
          end
          it 'installs percona' do
            expect(chef_run).to include_recipe('percona-multi::slave')
          end
        end
      end
    end
  end
end
