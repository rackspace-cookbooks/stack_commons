# Encoding: utf-8
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'
require 'json'

Dir['./test/unit/spec/support/**/*.rb'].sort.each { |f| require f }

::LOG_LEVEL = :fatal
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}

def node_resources(node)
  node.automatic['example']['attribute'] = 'lions, tigers and bears!'

  node.default_unless['redisio']['servers'] = []
  node.default['redisio']['servers'] << { 'name' => '6379-sentinel',
                                          'port' => 6379 }

  node.default['redisio']['servers'] << { 'name' => '6380-slave',
                                          'port' => 6380,
                                          'slaveof' => {
                                            'address' => 'localhost',
                                            'port' => 6379
                                          }
                                   }

  node.default_unless['redisio']['sentinels'] = []
  node.default['redisio']['sentinels'] << { 'name' => '6381-sentinel',
                                            'sentinel_port' => 6381,
                                            'master_ip' => 'localhost',
                                            'master_port' => 6379 }
end

def stub_resources
  stub_command('which sudo').and_return('/usr/bin/sudo')
end

at_exit { ChefSpec::Coverage.report! }
