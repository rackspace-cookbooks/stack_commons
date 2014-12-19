source 'https://supermarket.getchef.com'

cookbook 'newrelic_plugins', git: 'git@github.com:rackspace-cookbooks/newrelic_plugins_chef.git'
cookbook 'cron', git: 'git@github.com:rackspace-cookbooks/cron.git'

group :integration do
  cookbook 'disable_ipv6', path: 'test/fixtures/cookbooks/disable_ipv6'
  cookbook 'wrapper', path: 'test/fixtures/cookbooks/wrapper'
  cookbook 'apt'
  cookbook 'yum'

  # for elkstack testing with test fixture / wrapper cookbook
  cookbook 'kibana', '~> 1.3', git:'git@github.com:lusis/chef-kibana.git'

  # until https://github.com/elasticsearch/cookbook-elasticsearch/pull/230
  cookbook 'elasticsearch', '~> 0.3', git:'git@github.com:racker/cookbook-elasticsearch.git'

  # until https://github.com/lusis/chef-logstash/pull/336
  cookbook 'logstash', git:'git@github.com:racker/chef-logstash.git'

end

metadata
