require_relative 'spec_helper'

describe 'configures newrelic meetme for nginx' do
  context file('/etc/newrelic/newrelic-plugin-agent.cfg') do
    its(:content) { should match(/nginx/) }
  end
end

describe 'configures newrelic meetme for uwsgi' do
  context file('/etc/newrelic/newrelic-plugin-agent.cfg') do
    its(:content) { should match(/uwsgi/) }
  end
end

describe 'configures newrelic meetme for redis' do
  context file('/etc/newrelic/newrelic-plugin-agent.cfg') do
    its(:content) { should match(/redis/) }
  end
end

describe 'configures newrelic meetme for rabbitmq' do
  context file('/etc/newrelic/newrelic-plugin-agent.cfg') do
    its(:content) { should match(/rabbitmq/) }
    its(:content) { should match(/15672/) }
  end

end

describe 'configures newrelic meetme for memcached' do
  context file('/etc/newrelic/newrelic-plugin-agent.cfg') do
    its(:content) { should match(/memcached/) }
  end
end
