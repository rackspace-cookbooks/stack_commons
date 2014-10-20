default['redisio']['servers'] = []
default['redisio']['servers'] << { 'name' => '6379-master',
                                   'port' => 6379 }

default['redisio']['servers'] << { 'name' => '6380-slave',
                                   'port' => 6380,
                                   'slaveof' => {
                                     'address' => 'localhost',
                                     'port' => 6379
                                   }
                                 }

default['redisio']['sentinels'] = []
default['redisio']['sentinels'] << { 'name' => '6381-sentinel',
                                     'sentinel_port' => 6381,
                                     'master_ip' => 'localhost',
                                     'master_port' => 6379 }

default['redis-multi']['sentinel_port'] = 6381
