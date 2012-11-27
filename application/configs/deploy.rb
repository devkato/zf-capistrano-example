# general settings
set :application, "geek_app"
default_run_options[:pty] = true
set :use_sudo, false

# source control settings
set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git://github.com/devkato/zf-capistrano-example.git"
set :maintenance_template_path, File.join(File.dirname(__FILE__), "..", "..", "public", "maintenance.html.erb")

# stages
set :stages, %w(staging production)
set :stage_dir, "application/configs/deploy"
require 'capistrano/ext/multistage' 


namespace :deploy do
  task :migrate do
    # overrides the standard Rails database migrations task
  end

  task :start, :roles => :app do
    run %!sudo /sbin/service httpd start!
  end

  task :stop, :roles => :app do
    run %!sudo /sbin/service httpd stop!
  end

  task :restart, :roles => :app do
    run %!sudo /sbin/service httpd graceful!
  end 
end
