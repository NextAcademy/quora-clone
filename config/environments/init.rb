# Specify gemfile Location and general variables
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# Perform requiring gem that we need
######################################################################
	# basic
require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'pathname'

	# database
require 'pg'
require 'active_record'
require 'logger'

	# sinatra
require 'sinatra'
require "sinatra/reloader" if development?

	# embedded ruby
require 'erb'
require 'uri'
######################################################################


# System Setup
######################################################################
# Setup app root folder and name
APP_ROOT = Pathname.new(File.expand_path('../../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Setup sessions, logging and dump_errors
use Rack::Session::Cookie, expire_after: ENV['SESSION_EXPIRE'] || 2592000, # seconds
                           secret: ENV['SESSION_SECRET'] || 'this is a secret shhhhh'
set :logging, true
set :dump_errors, false
set :app_file, __FILE__
enable :sessions

# Setup Models (M) and its database
require APP_ROOT.join('config', 'database')

# Setup views (V)
set :views, File.join(APP_ROOT, "app", "views")

# Setup controller (C)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
######################################################################