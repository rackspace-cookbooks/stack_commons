stack_commons CHANGELOG
=======================

This file is used to list changes made in each version of the stack_commons cookbook.

0.0.41
------
- @cybermerc - added percona master/slave recipes

0.0.40
------
- @prometheanfire - change memcache iptables rules to be search based

0.0.39
------
- @martinb3 - Fix python ordering a bit further

0.0.38
------

- @martinb3 - Move python recipe out by itself, add workaround for #85

0.0.35
------

- @cybermerc - Pin mysql cookbook to < 6 until mysql bits can be updated.

0.0.34
------
- Release skipped.

0.0.33
------
- @jujugrrr - Pinned cookbook `database` to >= 2.3.1, related to https://github.com/opscode-cookbooks/database/issues/99

0.0.32
------
- @martinb3 - Fix logic bug / missing nil check

0.0.31
------
- @martinb3 - Add feature to handle global privs (some software requires the db user have SUPER for triggers, etc)

0.0.30
------
- @seeafish - Move pip setuptools upgrade out of pythonstack conditional and into main newrelic recipe
- @seeafish - Forced utf-8 encoding on secure_password return value for rabbitmq password as it breaks newrelic

0.0.29
------
- @martin - allow mysql monitoring template to converge on non-cloud boxes, actually test this by converging platformstack as part of stack_commons, in a separate test suite
- @lmunro - changed rabbitmq logstash template to put all logs on a single line in a single message.
- @martinb3 - Move newrelic tests from chefspec to serverspec, as upstream released a new version of the newrelic meetme agent cookbook, switching to LWRPs for some pieces of functionality we were testing in chefspec
- @martinb3 - Removes the extraneous testing of distros where we did not check any differences
- @martinb3 - Added some guards for recipes that did not like being converged with 'demo' set to true but with nginx enabled (the demo was only working w/ apache)

0.0.28
------

- @martinb3 - Revert removal of mysql::client RE: https://github.com/rackspace-cookbooks/pythonstack/issues/131 and #64.

0.0.27
------
- @seeafish - Add a fatal for mysql on ubuntu versions older than 14.04, as it will due to upstream
- @seeafish - Remove mysql::client include as it's called by database::mysql anyway and causes compatibility issues

0.0.26
------
- @seeafish - No change.

0.0.25
------
- @martinb3 - Use node.deep_fetch, guard access to nested attrs

0.0.24
------
- @martinb3 - Ensure a default value for custom monitoring array when not using platformstack.

0.0.23
------
- @martinb3 - Removed platformstack dependencies and use attributes for configuring monitors.

0.0.22
------
- @jujugrrr - Changed mysql logtash log path to match mysql multi

0.0.21
------
- @jujugrrr - Changed rabbitmq monitoring port to 15672 and not the rabbitmq port (set by rabbitmq::mgmt_console)

0.0.20
------
- @jujugrrr - Added mysql plugin support to newrelic

0.0.19
------
- @seeafish - Added redis meetme functionality and cleaned up newrelic in general by removing refs to stackname and updating recipe inclusion checks.

0.0.16
------
- @cybermerc - Added glusterfs

0.0.15
------
- @jujugrrr - Fixed missing monitoring #26

0.0.12
------
- @martinb3 - Migrated the `logstash_commons` calls to use attributes on elkstack instead. Added tests to verify the templates are pushed out successfully when converged with elkstack::agent in a wrapper recipe.

0.0.11
-----
- @jujugrrr - Added newrelic recipe

0.0.9
-----
- @jujugrrr - Removed systemd workaround as we don't support Centos7 anymore

0.0.8
-----

Knife complained about uploading 0.0.7, but still uploaded, so I version bumped to be sure we had the latest/freshest:

```
$ knife cookbook site share stack_commons 'Other'
Generating metadata for stack_commons from /tmp/chef-stack_commons-build20141021-673-supw6x/stack_commons/metadata.rb
Making tarball stack_commons.tgz
ERROR: Error uploading cookbook stack_commons to the Opscode Cookbook Site: parse error: trailing garbage
                                   500 Internal Server Error If you ar
                     (right here) ------^
. Increase log verbosity (-VV) for more information.
```

0.0.7
-----
- @martinb3 - Added redis

0.0.6
-----
- [Julien Berard] - Added memcached

0.0.3
-----
- [Julien Berard] - Added mongodb_standalone

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
