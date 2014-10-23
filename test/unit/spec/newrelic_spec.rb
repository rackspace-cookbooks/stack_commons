# Encoding: utf-8

require_relative 'spec_helper'

describe 'stack_commons::newrelic' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      # Context for each platform
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
            node_resources(node)
          end.converge(described_recipe)
        end

        context 'pythonstack' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['stack_commons']['stackname'] = 'pythonstack'
            end.converge(described_recipe)
          end

          %w( platformstack::default newrelic::python_agent python::package python::pip python newrelic_meetme_plugin).each do |recipe|
            it "includes #{recipe} recipe" do
              expect(chef_run).to include_recipe(recipe)
            end
            it 'ugrades setup tools' do
              expect(chef_run).to upgrade_python_pip('setuptools')
            end
          end
        end

        context 'phpstack' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['stack_commons']['stackname'] = 'phpstack'
              # https://github.com/escapestudios- cookbooks/newrelic/blob/master/spec/unit/php_agent_spec.rb#L9
              node.set['newrelic']['php_agent']['web_server']['service_name'] = 'stub_service'
            end.converge(described_recipe)
          end
          %w( platformstack::default php newrelic::php_agent newrelic_meetme_plugin).each do |recipe|
            it "includes #{recipe} recipe" do
              expect(chef_run).to include_recipe(recipe)
            end
          end
        end

        context 'tomcatstack' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['stack_commons']['stackname'] = 'tomcatstack'
            end.converge(described_recipe)
          end
          %w( platformstack::default newrelic::java_agent newrelic_meetme_plugin).each do |recipe|
            it "includes #{recipe} recipe" do
              expect(chef_run).to include_recipe(recipe)
            end
          end
        end

        context 'memcached' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
            end.converge(described_recipe, 'memcached')
          end
          it 'configures newrelic meetme for memcached' do
            expect(chef_run).to render_file('/etc/newrelic/newrelic-plugin-agent.cfg').with_content('memcached')
          end
        end
        context 'rabbitmq' do
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['stack_commons']['webserver'] = 'nginx'
              node.set['stack_commons']['nginx']['sites']['80']['site1']['server_name'] = 'site1'
            end.converge(described_recipe, 'rabbitmq')
          end
          it 'configures newrelic meetme for rabbitmq' do
            expect(chef_run).to render_file('/etc/newrelic/newrelic-plugin-agent.cfg').with_content('rabbitmq')
          end
        end
        context 'nginx' do
          before do
            stub_command('which nginx').and_return(true)
          end
          let(:chef_run) do
            ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: LOG_LEVEL) do |node, server|
              node_resources(node)
              node.set['nginx']['sites']['chefspecsite']['uwsgi_port'] = '666'
            end.converge(described_recipe, 'nginx')
          end
          it 'configures nginx with a /server_status' do
            expect(chef_run).to render_file('/etc/nginx/sites-available/monitor.conf').with_content('server-status')
          end
          it 'enables /server_status' do
            expect(chef_run).to run_execute('nxensite monitor')
            expect(chef_run.execute('nxensite monitor')).to notify('service[nginx]').to(:reload)
          end
          it 'configures newrelic meetme for nginx' do
            expect(chef_run).to render_file('/etc/newrelic/newrelic-plugin-agent.cfg').with_content('nginx')
          end
          it 'configures newrelic meetme for uwsgi' do
            expect(chef_run).to render_file('/etc/newrelic/newrelic-plugin-agent.cfg').with_content('uwsgi')
          end
        end
      end
    end
  end
end
