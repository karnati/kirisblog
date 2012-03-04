# Load the rails application
require File.expand_path('../application', __FILE__)
Rails.env = 'production'
# Initialize the rails application
Kirisblog::Application.initialize!
