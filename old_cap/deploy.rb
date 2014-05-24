#require 'bundler/capistrano'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.1p76'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :application, "mnc"
set :repository,  "https://github.com/niftysniffer/mnc.git"

set :deploy_to, "/var/www/vhosts/optativ.net/miguel.optativ.net"
set :scm, :git
set :branch, "master"

set :user, "deploy"
set :group, "psacln"
set :use_sudo, false

set :rails_env, "production"
set :deploy_via, :copy

set :ssh_options, { :forward_agent => true }
set :keep_releases, 5

default_run_options[:pty] = true
server "178.77.97.239", :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Symlink shared config files"
  task :symlink_config_files do
    run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end

  # NOTE: I don't use this anymore, but this is how I used to do it.
  desc "Precompile assets after deploy"
  task :precompile_assets do
    run <<-CMD
      cd #{ current_path } &&
      #{ sudo } bundle exec rake assets:precompile RAILS_ENV=#{ rails_env }
    CMD
  end

  desc "Restart applicaiton"
  task :restart do
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end
end

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
