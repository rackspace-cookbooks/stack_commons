# Encoding: utf-8
name 'stack_commons'
maintainer 'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license 'Apache 2.0'
description 'provides common supporting features for stacks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.5'

depends 'apache2'
depends 'apt'
depends 'build-essential'
depends 'chef-sugar'
depends 'database'
depends 'logstash_commons'
depends 'memcached'
depends 'mongodb'
depends 'mysql'
depends 'mysql-multi'
depends 'newrelic'
depends 'newrelic_meetme_plugin'
depends 'openssl'
depends 'pg-multi'
depends 'platformstack'
depends 'rabbitmq'
depends 'rackspace_gluster'
depends 'redis-multi'
depends 'varnish'
depends 'yum'
depends 'yum-ius'
depends 'yum-epel'
