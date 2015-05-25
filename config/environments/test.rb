# Include the general initialization 
require File.expand_path("../init", __FILE__)

# Requiring the necessary gem for testing
require 'rspec'
require 'rack/test'

# Creating constant pathname
APP_TEST_CONFIG = File.join(APP_ROOT, "config", "environments", "test")
APP_MODELS = File.join(APP_ROOT, "app", "models")
APP_CONTROLLERS = File.join(APP_ROOT, "app", "controllers")
APP_VIEWS = File.join(APP_ROOT, "app", "views")

# Defining app as Sinatra application
def app
	Sinatra::Application
end
