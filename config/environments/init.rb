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

# Setup views (V)
set :views, File.join(APP_ROOT, "app", "views")

# Setup controller (C)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
######################################################################