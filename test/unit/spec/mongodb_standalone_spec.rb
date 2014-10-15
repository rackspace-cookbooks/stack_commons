# Encoding: utf-8

require_relative 'spec_helper'

# this will pass on stack_commons, fail elsewhere, forcing you to
# write those chefspec tests you always were avoiding
describe 'stack_commons::mongodb_standalone' do
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

        %w( chef-sugar mongodb::mongodb_org_repo mongodb::default).each do |recipe|
          it "includes #{recipe} recipe" do
            expect(chef_run).to include_recipe(recipe)
          end
        end
        it "doesn\'t include logstash_commons::mongodb recipe" do
          expect(chef_run).to_not include_recipe('logstash_commons::mongodb')
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
          it 'includes logstash_commons::mongodb recipe' do
            expect(chef_run).to include_recipe('logstash_commons::mongodb')
          end
        end

      end
    end
  end
end
