require_relative 'spec_helper'

# fairly simple unit tests since this is from an upstream cookbook.
# we are mostly testing our own overrides.

describe service('redis_sentinel_6381-sentinel') do
  it { should be_enabled }
end

case os[:family]
when 'Ubuntu'
  describe process('redis-server') do
    # must use process here as serverspec expects init scripts to return stdout
    # "running" and falls back to a bad 'ps aux'
    it { should be_running }
  end
else
  describe service('redis_sentinel_6381-sentinel') do
    it { should be_running }
  end
end

# master, slave, sentinel
[6379, 6380, 6381].each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

describe file('/etc/redis/sentinel_6381-sentinel.conf') do
  its(:content) { should match(/port 6381/) }
  its(:content) { should match(/sentinel monitor/) }

end
