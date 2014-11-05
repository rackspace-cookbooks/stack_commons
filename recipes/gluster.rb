
# this is example is also the default behavior in the cookbook.rb recipe
# when no recipe gluster.rb is found in the generator cookbook

context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)

template "#{cookbook_dir}/attributes/gluster.rb" do
  source "attributes/gluster.rb.erb"
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end

template "#{cookbook_dir}/recipes/gluster.rb" do
  source "recipes/gluster.rb.erb"
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end
