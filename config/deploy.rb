require 'capistrano'

require 'capistrano-vexxhost'
require 'json'
require 'benchmark'
require 'yaml'
require 'capistrano/recipes/deploy/scm'
require 'capistrano/recipes/deploy/strategy'

def _cset(name, *args, &block)
  unless exists?(name)
    set(name, *args, &block)
  end
end

  require 'bundler/capistrano'
_cset :application, "kirisblog"
_cset :repository, "git@github.com:karnati/kirisblog.git"
_cset :scm, :git
_cset :deploy_via, :checkout

_cset(:deploy_to) { "/home/kiriblog/apps/#{application}" }
_cset(:revision) { source.head }

_cset :rails_env, "development"
_cset :rake, "rake"

set :domain, "https://shared80.mtl.net.vexxhost.com"
set :application, "kirisblog"
set :user, "kiriblog"
set :password, "kiran@12345"
_cset :server_hostname,  "https://shared80.mtl.net.vexxhost.com"
set :scm, :git
set :scm_username, 'karnati'
set :scm_password, 'kumar123'
set :repository, "git@github.com:karnati/kirisblog.git"
set :deploy_to, "ssh://kiriblog@kiris.in/home/kiriblog/workspace/kirisblog"
#set :use_sudo, :false
set :rake,           "rake"
  set :rails_env,      "development"




default_run_options[:pty] = true



set :branch, "master"
set :deploy_via, :remote_cache




# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end


# Account Settings
=begin
set :user, "kiriblog"
set :password, "kiran@12345"
set :use_sudo, :false

set :server_hostname , "www.kiris.in"
set :domain, 'https://shared80.mtl.net.vexxhost.com'
set :mount_path, "/"
set :application, "kirisblog"
set :repository, "/home/kiriblog/workspace/kirisblog"
#set :local_repository, "/home/kiriblog/workspace/kirisblog"
set :scm, :git
set :scm_username, 'karnati'
set :scm_password, 'kumar123'
set :repository, "git@github.com:karnati/kirisblog.git"
set :deploy_via, :copy

role :db, 'www.kiris.in'
role :app, 'www.kiris.in'
role :web, 'www.kiris.in'
=end


=begin
set :user, 'kiriblog'
set :domain, 'www.kiris.in'
set :applicationdir, "kirisblog"

set :scm, 'git'
set :repository,  "ssh://kiriblog@kiris.in/workspace/kirisblog.git"
#set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, "ssh://kiriblog@kiris.in/workspace/kirisblog"
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false

# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
=end
=begin

  set :use_sudo, :false

  _cset :server_hostname , "www.kiris.in"



set :user, 'kiriblog'  # Your dreamhost account's username
set :domain, 'https://shared80.mtl.net.vexxhost.com'  # Dreamhost servername where your account is located
set :project, 'kirisblog'  # Your application as its called in the repository
set :application, 'kirisblog.kiris.in'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/apps/#{application}"  # The standard Dreamhost setup
 set(:auth_string) { Base64.encode64("#{fetch(:user)}:#{fetch(:password)}").strip }
# version control config
set :scm, 'git'
set :scm_username, 'karnati'
set :scm_password, 'kumar123'
set :repository, "git@github.com:karnati/kirisblog.git"


set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false
=end
