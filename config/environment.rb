# Load the rails application
require File.expand_path('../application', __FILE__)

# Load app vars from local file
kowoko_env = File.join(Rails.root, 'config', 'kowoko.rb')
load(kowoko_env) if File.exists?(kowoko_env)

# Initialize the rails application
Kowoko::Application.initialize!
