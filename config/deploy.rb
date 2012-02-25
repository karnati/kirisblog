require 'capistrano'
require 'capistrano-vexxhost'

# require 'bundler/capistrano'

# Account Settings
set :user, "kiriblog"
set :password, "kiran@12345"
set :domain, "www.kiris.in"
set :mount_path, "/"
set :application, "kirisblog"
set :repository, "/workspace/kirisblog"
set :local_repository, "/workspace/kirisblog"
set :scm, :git
set :deploy_via, :copy
=begin

set :application, "kirisblog"
set :user, "kiriblog"
set :password, "kiran@12345"
set :deploy_to,  "/var/home/kirisblog/workspace"
set :migrate_env, "rake db:migrate"
set :rake, "rake"
=end


=begin
set :application, "kiris.in"

set :user, "kiriblog"
set :password, "kiran@12345"
set :scm, 'git'
set :scm_username, 'karnati'
set :scm_password, 'kumar123'
set :repository, 'git@github.com:karnati/kirisblog.git'
set :domain, "kiris.in"
set :port, 3010
set :deploy_to,  "/home/kiriblog/rails_apps/kirisblog"
  set :use_sudo, false
  set :server_hostname,  'kiris.in'
   set :rails_env, "production"
set(:deploy_to)         {"/home/kiriblog/rails_apps/kirisblog"}
set(:releases_path)     { File.join(deploy_to, version_dir) }
set(:shared_path)       { File.join(deploy_to, shared_dir) }
set(:current_path)      { File.join(deploy_to, current_dir) }
set(:release_path)      { File.join(releases_path, release_name) }
  role(:web) { fetch(:server_hostname) }
  role(:app) { fetch(:server_hostname) }
  role(:db)  { fetch(:server_hostname) }

  before 'deploy:setup', 'deploy:create_app'
  # Mount application after setting it up
  after 'deploy:setup', 'deploy:mount'
=end

=begin
# Account Settings
set :user, "kiriblog"
set :password, "kiran@12345"
set :domain, "www.kiris.in"
#set :mount_path, "/"
set :application, "www.kiris.in"


set :scm, :git
set :repository, "git@github.com:karnati/kirisblog.git"
=end
