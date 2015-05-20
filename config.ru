# Load centralized environment configurations
require ::File.expand_path('../config/environments/init', __FILE__)

run Sinatra::Application
