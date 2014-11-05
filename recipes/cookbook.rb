
context = ChefDK::Generator.context
generator_cookbook_path = "#{context.generator_cookbook}/code_generator"
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)

# cookbook root dir
directory cookbook_dir

# generic
cookbook_templates = %w(
  metadata.rb
  README.md
  CONTRIBUTING.md
  CHANGELOG.md
  Berksfile
  Rakefile
  Gemfile
  Guardfile
  Thorfile
  .rubocop.yml
  .kitchen.yml
  .gitignore
  chefignore
)
cookbook_templates.each do |template_file|
  template "#{cookbook_dir}/#{template_file}" do
    helpers(ChefDK::Generator::TemplateHelper)
    action :create_if_missing
  end
end

# Default recipe(s)
directory "#{cookbook_dir}/recipes"
template "#{cookbook_dir}/recipes/default.rb" do
  source "recipes/default.rb.erb"
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end

# default attributes file
directory "#{cookbook_dir}/attributes"
template "#{cookbook_dir}/attributes/default.rb" do
  source "attributes/default.rb.erb"
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end

# generic testing skeleton
directory "#{cookbook_dir}/test"
# copy tests directory without templating it
remote_directory "#{cookbook_dir}/test" do
  source "test"
end

# need a way to escape format_disk so it isn't interpreted as a feature flag
feature_flags = %w(
  logstash
  gluster
  git
  nginx
  formatdisk
  memcached
  mongodb_standalone
  mysql_add_drive
  mysql_base
  mysql_holland
  mysql_master
  mysql_slave
  newrelic
  nginx
  postgresql_base
  postgresql_master
  postgresql_slave
  rabbitmq
  redis_base
  redis_master
  redis_sentinel
  redis_single
  redis_slave
  varnish
)

# This enables individual feature flags. There are two ways that are supported.
#
# First -- using logstash as an example. If `-a logstash=true` (or any value is
# set that is truthy), `include_recipe 'logstash.rb'` will be run.
#
# Second -- using webserver_apache and webserver_nginx as an example. If
# `-a webserver=apache`, then `webserver_apache` will be included. Nginx would
# work the same way. If a flag with an unknown value is supplied, it will fall
# back to including just the recipe that matches a flag name.
#
# Remember that recipes can include other recipes, so there is no need to have
# a recipe like `webserver_base` in this example. Just include it in the other
# two values.
#
feature_flags.each do |flag|
  if flag.include?("_")
    # flags with a value that must match a recipe
    (flag_name, flag_value) = flag.split("_")
    if flag_value && flag_name
      begin
        # send blows up if you have an invalid flag_name (no value, means turn it off)
        flag_activated = context.send(flag_name.to_sym) == flag_value
      rescue
        flag_activated = false
      end
    end
    flag_filename = "#{flag_name}_#{flag_value}"
  else
    flag_name = flag
    flag_activated = true # any truthy value
    flag_filename = "#{flag_name}"
  end

  next unless flag_activated

  if File.exists?("#{generator_cookbook_path}/recipes/#{flag_filename}.rb")
    # if there's a recipe, call it
    include_recipe "code_generator::#{flag_filename}"
    next # don't render anything below if we found a recipe that might do it
  end

  # if there's a matching template, render it
  template "#{cookbook_dir}/recipes/#{flag_filename}.rb" do
    source "recipes/#{flag_filename}.rb.erb"
    helpers(ChefDK::Generator::TemplateHelper)
    action :create_if_missing
    only_if { File.exists?("#{generator_cookbook_path}/templates/default/recipes/#{flag_filename}.rb") }
  end

  # render corresponding attribute file, if it exists
  template "#{cookbook_dir}/attributes/#{flag_filename}.rb" do
    source "attributes/#{flag_filename}.rb.erb"
    helpers(ChefDK::Generator::TemplateHelper)
    action :create_if_missing
    only_if { File.exists?("#{generator_cookbook_path}/templates/default/attributes/#{flag_filename}.rb") }
  end

end
