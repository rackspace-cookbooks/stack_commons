stack_commons Cookbook
======================
Common recipes/libraries required by other stacks (phpstacks/pythonstacks ...)

Requirements
------------

Attributes
----------
TODO: List your cookbook attributes here.

Usage
-----
### Recipes
#### stack_commons::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `stack_commons` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stack_commons]"
  ]
}
```
#### stack_commons::newrelic
Just include `stack_commons::newrelic` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stack_commons::newrelic]"
  ]
}
```

---
Warning :
Due to a resource name conflict between elasticsearch and newrelic_plugins cookbook we are using a fork rather than the upstream cookbook. You need to get this fork or add the following lines to your Berkshelf file :
```
cookbook 'newrelic_plugins', git: 'git@github.com:rackspace-cookbooks/newrelic_plugins_chef.git'
```
More details : https://github.com/newrelic-platform/newrelic_plugins_chef/pull/29


Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
