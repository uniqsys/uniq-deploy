# -*- encoding : utf-8 -*-

# ==============================================
# universal web app UNIQ Systems deployment part
# ==============================================
require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano_colors'
load "deploy/assets"

# common variables
{
  repository:        "git@red:#{application}.git",
  domain:            "#{application}@production-192",
  deploy_to:         "/home/#{application}/app",
  rails_env:         'production',
  use_sudo:          false,
  rvm_ruby_string:    "#{ruby_version}@#{application}",
  scm:                :git,
  git_shallow_clone:  1,
  keep_releases:      5,
  rvm_path:          '/usr/local/rvm',
  rvm_bin_path:      '/usr/local/rvm/bin'
}.each { |key, value| set key, value }

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :add_revision, :roles => :app do
    revision = %x{git ls-remote #{repository} #{branch}}
    run %Q{echo "#{revision}" #{release_path}/REVISION}
  end
end

after "bundle:install", "deploy:symlink_shared"
after "bundle:install", "deploy:add_revision"
after "deploy:update", "deploy:cleanup"
