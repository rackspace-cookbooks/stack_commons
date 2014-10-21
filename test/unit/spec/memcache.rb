# Encoding: utf-8

require_relative 'spec_helper'

describe 'stack_commons::memcached' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      # Context for each platform
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node|
            node_resources(node)
          end.converge(described_recipe)
        end

        if platform.upcase == 'UBUNTU'
          it 'includes apt recipe' do
            expect(chef_run).to include_recipe('apt')
          end
        else
          it "doesn\'t include apt recipe" do
            expect(chef_run).to_not include_recipe('apt')
          end
        end

        it 'includes memcached recipe' do
          expect(chef_run).to include_recipe('memcached')
        end
        it "doesn\'t include logstash_commons::memcached recipe" do
          expect(chef_run).to_not include_recipe('logstash_commons::memcached')
        end

        # context for elkstack logging enabled
        context 'with ELKstack logging enabled' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node|
              node_resources(node)
              node.set['logstash_commons']['restart_service'] = false # need logstash cookbook to do this
              node.set['platformstack']['elkstack_logging']['enabled'] = true
            end.converge(described_recipe)
          end
          it 'includes logstash_commons::memcached recipe' do
            expect(chef_run).to include_recipe('logstash_commons::memcached')
          end
        end

      end
    end
  end
end
