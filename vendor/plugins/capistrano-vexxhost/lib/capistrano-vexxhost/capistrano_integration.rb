require 'base64'
require 'net/http'
require 'json'

Capistrano::Configuration.instance(:must_exist).load do
  set(:deploy_to)       { "/home/#{fetch(:user)}/apps/#{fetch(:application)}" }
  set(:use_sudo)        { false }
  set(:auth_string)     { Base64.encode64("#{fetch(:user)}:#{fetch(:password)}").strip }
  _cset(:server_hostname) { fetch(:domain) }

  role(:web) { fetch(:server_hostname) }
  role(:app) { fetch(:server_hostname) }
  role(:db)  { fetch(:server_hostname) }

  # Create serverside application when setting up
  before 'deploy:setup', 'deploy:create_app'
  # Mount application after setting it up
  after 'deploy:setup', 'deploy:mount'

  namespace :deploy do
    desc <<-DESC
      Create a remote application using the cPanel API in order to make
      all the required folders and the service records.
    DESC
    task :create_app, :except => { :no_release => true } do
      # Create the remote app first
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "addapp", {'appname' => application, 'path' => "apps/#{application}"})

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end

    desc <<-DESC
      Start the Rails application on the server
    DESC
    task :start, :roles => :app do
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "startapp", {'appname' => application})

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      else
        puts response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end

    desc <<-DESC
      Stop the Rails application on the server
    DESC
    task :stop, :roles => :app do
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "stopapp", {'appname' => application})

      # Empty response = not running
      if response_hash.nil?
        raise "The rails application is not running."
      end

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      else
        puts response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end

    desc <<-DESC
      Restart the Rails application on the server
    DESC
    task :restart, :roles => :app do
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "restartapp", {'appname' => application})

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      else
        puts response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end

    desc <<-DESC
      Mount the application to a specific section of the website
    DESC
    task :mount, :roles => :app do
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "setuprewrite", {'appname' => application, 'rewritedomain' => domain, 'rewriteurl' => mount_path})

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      else
        puts response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end

    desc <<-DESC
      Unmount the application from the website
    DESC
    task :unmount, :roles => :app do
      response_hash = cpanel_api2_command(server_hostname, auth_string, "RoR", "removerewrite", {'appname' => application, 'rewritedomain' => domain, 'rewriteurl' => mount_path})

      if response_hash["cpanelresult"]["data"][0]["status"] != 1
        raise response_hash["cpanelresult"]["data"][0]["statusmsg"]
      else
        puts response_hash["cpanelresult"]["data"][0]["statusmsg"]
      end
    end
  end

  # Run a remote command using the cPanel API2
  def cpanel_api2_command(hostname, authorization, _module, func, args)
    # Prepare the request
    request_hash = { 'cpanel_jsonapi_module' => _module,
                     'cpanel_jsonapi_func' => func }.merge(args)
    request_query = request_hash.to_a.map { |kv| "#{kv[0]}=#{kv[1]}" }.join("&")
    request_location = "/json-api/cpanel?#{request_query}"

    # Run the request
    Net::HTTP.start(hostname, 2083, :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
      request = Net::HTTP::Get.new(request_location, {'Authorization' => "Basic #{authorization}"})
      response = http.request(request)

      return (response.body.empty?) ? nil : JSON.parse(response.body)
    end
  end

end
