require_relative 'spec_helper'

# fairly simple unit tests since this is from an upstream cookbook.
# we are mostly testing our own overrides.

# broken in serverspec, see https://github.com/serverspec/specinfra/pull/326
# describe service('logstash_agent') do
#  it { should be_enabled }
# end

logstash_extra_config_files =
%w(
  input_apache.conf
  input_gluster.conf
  input_memcached.conf
  input_mongodb.conf
  input_mysql.conf
  input_nginx.conf
  input_postgresql.conf
  input_rabbitmq.conf
  input_redis.conf
  input_varnish.conf
)

logstash_extra_config_files.each do |cfg|
  describe file("/opt/logstash/agent/etc/conf.d/#{cfg}") do
    it { should be_file }
  end
end
