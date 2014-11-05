# not sure why we had a stack_commons attribute file for cloud monitoring, I
# guess just for additional monitors.

context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)

template "#{cookbook_dir}/attributes/cloud_monitoring.rb" do
  source "attributes/cloud_monitoring.rb.erb"
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end
