# this recipe initializes a git repo for the new cookbook if git is installed

context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)

# git
if context.have_git
  if !context.skip_git_init
    execute("initialize-git") do
      command("git init .")
      cwd cookbook_dir
    end
  end
end
