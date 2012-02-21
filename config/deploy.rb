#require 'capistrano'
require 'capistrano-vexxhost'
 require 'bundler/capistrano'
=begin

set :application, "kirisblog"
set :user, "kiriblog"
set :password, "kiran@12345"
set :deploy_to,  "/var/home/kirisblog/workspace"
set :migrate_env, "rake db:migrate"
set :rake, "rake"
=end


set :application, "kirisblog"
set :domain, "www.kiris.in"
set :user, "kiriblog"
set :port, 3010
set :repository, "/usr/home/#{user}/#{application}"
set :scm, :none
set :runner, user
set :use_sudo, false
set :deploy_via, :copy
set :deploy_to, "/usr/local/www/#{user}/#{application}"
set :group_writable, false
role :app, domain
role :web, domain
role :db, domain, :primary => true

=begin
# Account Settings
set :user, "kiriblog"
set :password, "kiran@12345"
set :domain, "www.kiris.in"
#set :mount_path, "/"
set :application, "kirisblog"


set :scm, :git
set :repository, "git@github.com:karnati/kirisblog.git"
=end
