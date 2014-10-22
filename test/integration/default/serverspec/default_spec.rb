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

# varnish
describe service('varnish') do
  it { should be_enabled }
  it { should be_running }
end
describe port(6081) do
  it { should be_listening }
end

# mysql base
if os[:family] == 'redhat'
  describe service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end
else
  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end
end
describe port(3306) do
  it { should be_listening }
end

# postgresql
if os[:family] == 'redhat'
  # process is named postgres
  describe service('postgres') do
    it { should be_running }
  end
  # service is named postgresql...
  describe service('postgresql') do
    it { should be_enabled }
  end
  describe service('postgres') do
    it { should be_running }
  end
else
  describe service('postgresql') do
    it { should be_enabled }
    it { should be_running }
  end
  describe service('postgresql') do
    it { should be_running }
  end
end

describe service('memcached') do
  it { should be_enabled }
  it { should be_running }
end
describe port(11_211) do
  it { should be_listening }
end

if os[:family] == 'redhat'
  mongo_service = 'mongod'
else
  mongo_service = 'mongodb'
end
describe service(mongo_service) do
  it { should be_enabled }
end
describe service(mongo_service) do
  it { should be_running }
end
