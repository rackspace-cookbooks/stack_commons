This is an incomplete example, but the operative things you should check out are:
- files and templates (these can be used to inject files whole or with ERB processing)
- recipes/cookbook.rb - this calls other recipes if appropriate flag is given on commandline

An example of a run:
```
mart6985@mart6985-laptop:~/src/chefenv/123456-testcustomer/cookbooks$ rm -rf my_customer ; chef generate cookbook my_customer -g . -a stack=php -a webserver=apache -a datastore=mysql
Compiling Cookbooks...
[2014-11-05T11:39:10-06:00] WARN: Cloning resource attributes for template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] from prior resource (CHEF-3694)
[2014-11-05T11:39:10-06:00] WARN: Previous template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:124:in `block in from_file'
[2014-11-05T11:39:10-06:00] WARN: Current  template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:124:in `block in from_file'
[2014-11-05T11:39:10-06:00] WARN: Cloning resource attributes for template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] from prior resource (CHEF-3694)
[2014-11-05T11:39:10-06:00] WARN: Previous template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:132:in `block in from_file'
[2014-11-05T11:39:10-06:00] WARN: Current  template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:132:in `block in from_file'
Recipe: code_generator::cookbook
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb from none to 693f10
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md from none to 739ea3
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md from none to 6e0dbd
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md from none to 4c8a02
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile from none to cb27bf
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile from none to 765afe
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile from none to 8617bd
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile from none to 66f018
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile from none to c75cb3
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml from none to 9f1124
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml from none to 677347
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore from none to c69720
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore from none to d4198c
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb from none to 6d2c46
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb from none to fa4065
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test
  * remote_directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test] action create
  Recipe: <Dynamically Defined Resource>
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb from none to accfe1
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb from none to e3b5ed
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb from none to ad188e
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb from none to 7597c8
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb from none to 370d3b
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb from none to bface0
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json from none to 13aeae
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json from none to d92d0b
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb from none to 3cd220
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb from none to 76450c
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb from none to f9855a
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb from none to 1bb328
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb from none to 495579
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md from none to 729740
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md from none to 585d62
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb from none to 667d76
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb from none to 9adb07
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb from none to 05be48
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb from none to 2eef12
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md from none to e3b0c4
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json from none to dba4ac
      (diff output suppressed by config)
      - change mode from '' to '0644'

Recipe: code_generator::cookbook
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/logstash.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/logstash.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/gluster.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/gluster.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/git.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/git.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/formatdisk.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/formatdisk.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/memcached.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/memcached.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/newrelic.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/newrelic.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/rabbitmq.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/rabbitmq.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/varnish.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/varnish.rb] action create_if_missing (skipped due to only_if)
```

After activating gluster:
```
mart6985@mart6985-laptop:~/src/chefenv/123456-testcustomer/cookbooks$ rm -rf my_customer ; chef generate cookbook my_customer -g . -a gluster=true
Compiling Cookbooks...
[2014-11-05T11:51:26-06:00] WARN: Cloning resource attributes for template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] from prior resource (CHEF-3694)
[2014-11-05T11:51:26-06:00] WARN: Previous template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:125:in `block in from_file'
[2014-11-05T11:51:26-06:00] WARN: Current  template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:125:in `block in from_file'
[2014-11-05T11:51:26-06:00] WARN: Cloning resource attributes for template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] from prior resource (CHEF-3694)
[2014-11-05T11:51:26-06:00] WARN: Previous template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:133:in `block in from_file'
[2014-11-05T11:51:26-06:00] WARN: Current  template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb]: /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/code_generator/recipes/cookbook.rb:133:in `block in from_file'
Recipe: code_generator::cookbook
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/metadata.rb from none to 693f10
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/README.md from none to 739ea3
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CONTRIBUTING.md from none to 6e0dbd
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/CHANGELOG.md from none to 4c8a02
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Berksfile from none to cb27bf
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Rakefile from none to 765afe
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Gemfile from none to 8617bd
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Guardfile from none to 66f018
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/Thorfile from none to c75cb3
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.rubocop.yml from none to 9f1124
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.kitchen.yml from none to 677347
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/.gitignore from none to c69720
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/chefignore from none to d4198c
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/default.rb from none to 6d2c46
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/default.rb from none to fa4065
    (diff output suppressed by config)
  * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test] action create
    - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test
  * remote_directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test] action create
  Recipe: <Dynamically Defined Resource>
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/supported_platforms.rb from none to accfe1
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/support/platform_properties.rb from none to e3b5ed
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/spec_helper.rb from none to ad188e
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/unit/spec/default_spec.rb from none to 7597c8
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/spec_helper.rb from none to 370d3b
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/integration/default/serverspec/default_spec.rb from none to bface0
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/14.04.json from none to 13aeae
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/ubuntu/12.04.json from none to d92d0b
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/demo.rb from none to 3cd220
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/recipes/default.rb from none to 76450c
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/metadata.rb from none to f9855a
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/redis.rb from none to 1bb328
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/attributes/default.rb from none to 495579
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/README.md from none to 729740
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/wrapper/CHANGELOG.md from none to 585d62
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/disable_ipv6.rb from none to 667d76
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/recipes/default.rb from none to 9adb07
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/metadata.rb from none to 05be48
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/attributes/default.rb from none to 2eef12
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/cookbooks/disable_ipv6/README.md from none to e3b0c4
      (diff output suppressed by config)
      - change mode from '' to '0644'
    * directory[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos] action create
      - create new directory /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos
      - change mode from '' to '0775'
      - change owner from '' to 'mart6985'
      - change group from '' to 'mart6985'
    * cookbook_file[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json] action create
      - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json
      - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/test/fixtures/platform/centos/6.5.json from none to dba4ac
      (diff output suppressed by config)
      - change mode from '' to '0644'

Recipe: code_generator::cookbook
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/logstash.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/logstash.rb] action create_if_missing (skipped due to only_if)
Recipe: code_generator::gluster
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/gluster.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/gluster.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/gluster.rb from none to b608a9
    (diff output suppressed by config)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/gluster.rb] action create_if_missing
    - create new file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/gluster.rb
    - update content in file /home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/gluster.rb from none to dcd0bf
    (diff output suppressed by config)
Recipe: code_generator::git
  * execute[initialize-git] action run
    - execute git init .
Recipe: code_generator::cookbook
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/formatdisk.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/formatdisk.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/memcached.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/memcached.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/newrelic.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/newrelic.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/nginx.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/rabbitmq.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/rabbitmq.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/recipes/varnish.rb] action create_if_missing (skipped due to only_if)
  * template[/home/mart6985/src/chefenv/123456-testcustomer/cookbooks/my_customer/attributes/varnish.rb] action create_if_missing (skipped due to only_if)
```
