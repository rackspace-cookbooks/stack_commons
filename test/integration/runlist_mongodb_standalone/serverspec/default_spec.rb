# Encoding: utf-8

require_relative 'spec_helper'

# apache
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
