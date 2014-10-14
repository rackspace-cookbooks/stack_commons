# Encoding: utf-8

require_relative 'spec_helper'

# rabbitmq
describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end
describe port(5672) do
  it { should be_listening }
end
