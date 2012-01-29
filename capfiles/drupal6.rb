load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# added to avoid server complaining about SUDO commands
# (http://www.mail-archive.com/capistrano@googlegroups.com/msg04755.html)
# also for git
default_run_options[:pty] = true

require 'rubygems'
require 'railsless-deploy' # Removes railsisms from Capistrano

after "deploy:setup", "deploy:post_setup"
after "deploy:update_code", "deploy:post_update_code"
 
# The project name.
set :application, "drupal6"
 
# List the Drupal multi-site folders.  Use "default" if no multi-sites are installed.
set :domains, ["default"]

# List folders that reside outside of SVN
# set :static_dirs, ["files","public","site-specific","jobs/_cache","jobs/uploads"]
set :static_dirs, ["files","public","site-specific"]
 
# username of owner of apache process
set :apache_user, "apache"
 
set :scm, :git
set :repository,  "git@github.com:FierceMarkets/publication-sites.git"
# run as the user logged in to SSH, including keys
ssh_options[:forward_agent] = true
set :branch, "master"
 
# Use a remote cache to speed things up
set :deploy_via, :remote_cache
 
# Generally don't need sudo for this deploy setup
set :use_sudo, false
 
# Set the deployment directory on the target hosts.
set :deploy_to, "/var/apps/#{application}"
set :web_path, "/var/www/#{application}"

# The hostnames to deploy to.
role :web, "web1.server.fiercemarkets.com"
 
# Specify one of the web servers to use for database backups or updates.
# This server should also be running Drupal.
role :db, "web1.server.fiercemarkets.com", :primary => true

set :user, "deploy"


namespace :deploy do
 
  # Overwritten to provide flexibility for people who aren't using Rails.
  desc "Prepares one or more servers for deployment."
  task :setup, :except => { :no_release => true } do
    dirs = [deploy_to, releases_path, shared_path]
    # domains.each do |domain|
    #   dirs += [shared_path + "/#{domain}/shared"]
    # end
    dirs += static_dirs.map { |d| File.join(shared_path, d) }
    run "umask 02 && mkdir -p #{dirs.join(' ')}" 
  end
 
  desc "Set up symlink from web root to current revision" 
  task :post_setup do
    # sudo "rm -rf #{web_path}"
    # fail if dir exists
    run "ln -s #{deploy_to}/current #{web_path}"
    run "chown -R #{shared_path}/files #{apache_user}" if static_dirs.include? "files"
    
  end
 
  desc "link file dirs" 
  task :post_update_code do
    domains.each do |domain|
      # link settings file
      # run "ln -nfs #{deploy_to}/#{shared_dir}/#{domain}/local_settings.php #{release_path}/sites/#{domain}/local_settings.php"
      # remove any link or directory that was exported from SCM, and link to remote Drupal filesystem
      static_dirs.each do |dir|
        run "rm -rf #{release_path}/#{dir}"
        run "ln -nfs #{deploy_to}/#{shared_dir}/#{dir} #{release_path}/#{dir}"
      end
      # run "chown #{apache_user} -R #{release_path}/jobs/_cache"
      # run "chown #{apache_user} -R #{release_path}/jobs/uploads"
    end
    run "rm -rf #{release_path}/europe"
    run "ln -fs #{release_path} #{release_path}/europe"
    run "rm -rf #{release_path}/techwatch"
    run "ln -fs #{release_path} #{release_path}/techwatch"
  end
 
  # desc '[internal] Touches up the released code.'
  task :finalize_update, :except => { :no_release => true } do
    run "chmod -R g+w #{release_path}"
    run "chmod -R +x #{release_path}/scripts"
    run "chmod -R g+w #{shared_path}/cached-copy" if deploy_via == :remote_cache
  end

  after "deploy", "deploy:cleanup"
  after "deploy", "deploy:restart"

  # Each of the following tasks are Rails specific. They're removed.
  task :migrate do
  end
 
  task :migrations do
  end
 
  task :cold do
  end
 
  task :start do
  end
 
  task :stop do
  end
 
  task :restart do
    #sudo "/etc/init.d/httpd graceful"
  end
 
end
