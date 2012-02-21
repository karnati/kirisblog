require 'capistrano'
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

set :user, "kiriblog"
set :password, "kiran@12345"
set :scm, 'git'
set :scm_username, 'karnati'
set :scm_password, 'kumar123'
set :repository, 'git@github.com:karnati/kirisblog.git'
set :domain, "www.kiris.in"
set :port, 3010


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
