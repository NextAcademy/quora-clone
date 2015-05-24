require 'rake'
require 'rspec/core/rake_task'

# Include environment settings
require ::File.expand_path('../config/environments/init', __FILE__)

# Require all ActiveSupport's class and extensions
require 'active_support/core_ext'

namespace :generate do
	desc "Create empty model spec in spec, e.g., rake generate:spec NAME=test_name"
	task :spec do
		unless ENV.has_key?('NAME')
			raise "Must specificy migration name, e.g., rake generate:spec NAME=test_name"
		end

		name			= ENV['NAME'].camelize
		filename	= "%s_spec.rb" % ENV['NAME'].underscore
		path			= APP_ROOT.join('spec', filename)

		if File.exist?(path)
			raise "ERROR: File '#{path}' already exists"
		end

		puts "Creating #{path}"
		File.open(path, 'w+') do |f|
			f.write(<<-EOF.strip_heredoc)
				# Requiring test environment file
				require 'spec_helper'

				# Requiring test subject file. Uncomment below.
				# require_relative File.join(APP_CONTROLLER, "static")

				# Test cases
				describe '#{name}' do
					pending "pending test cases"
				end
			EOF
		end
	end

	desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
	task :model do
		unless ENV.has_key?('NAME')
			raise "Must specificy model name, e.g., rake generate:model NAME=User"
		end

		if ENV['NAME'] != ENV['NAME'].singularize
			puts "==================================================================="
			puts "	WARNING: #{ENV['NAME']} is plural. Auto-correcting to singluar."
			puts "==================================================================="
			ENV['NAME'] = ENV['NAME'].singularize
		end

		model_name			= ENV['NAME'].camelize
		model_filename	= ENV['NAME'].underscore + '.rb'
		model_path			= APP_ROOT.join('app', 'models', model_filename)

		if File.exist?(model_path)
			raise "ERROR: Model file '#{model_path}' already exists"
		end

		puts "Creating #{model_path}"
		File.open(model_path, 'w+') do |f|
			f.write(<<-EOF.strip_heredoc)
				class #{model_name} < ActiveRecord::Base
					# This is Sinatra! Remember to create a migration!
				end
			EOF
		end
	end

	desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
	task :migration do
		unless ENV.has_key?('NAME')
			raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
		end

		name			= ENV['NAME'].camelize
		filename	= "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
		path			= APP_ROOT.join('db', 'migrate', filename)

		if File.exist?(path)
			raise "ERROR: File '#{path}' already exists"
		end

		puts "Creating #{path}"
		File.open(path, 'w+') do |f|
			f.write(<<-EOF.strip_heredoc)
				class #{name} < ActiveRecord::Migration
					def change
					end
				end
			EOF
		end
	end
end

namespace :db do
	desc "Create the database at #{DB_NAME}"
	task :create do
		puts "Create database #{DB_NAME} if it doesn't exist..."
		exec("createdb #{DB_NAME}")
	end

	desc "Drop the database at #{DB_NAME}"
	task :drop do
		puts "Dropping database #{DB_NAME}..."
		exec("dropdb #{DB_NAME}")
	end

	desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
	task :migrate do
		ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
		ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
		ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
			ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
		end
	end

	desc "Populate the database with dummy data by running db/seeds.rb"
	task :seed do
		require APP_ROOT.join('db', 'seeds.rb')
	end

	desc "Returns the current schema version number"
	task :version do
		puts "Current version: #{ActiveRecord::Migrator.current_version}"
	end
end


desc 'Initiate IRB console with environment loaded'
task "console" do
	exec "irb -r./config/environments/init"
end


desc 'Initiate IRB console with environment loaded'
task "server" do
	exec "shotgun config.ru"
end


desc 'Execute unit tests in spec'
RSpec::Core::RakeTask.new(:test)


desc 'default printout'
task :default do
	puts "
app instruction
===============
Server
-----------------
# launch the server
	$ rake server

Test and Debug
-----------------
# initiate irb console for this web server
	$ rake console

# performs all unit tests in spec folder.
	$ rake test

# spec - to create unit test 'spec/<filename>_spec.rb' file
	$ rake generate:spec NAME=<filename>

MVC
-----------------
# to create a model file
	$ rake generate:model NAME=<singular_model_name>


Database
-----------------
# to create the database
	$ rake db:create

# to create migration file 'db/migrate/<timestamp>_<filename>.rb'
	$ rake generate:migration NAME=<filename>
# REMINDER: be careful with ActiveRecord naming convention!

# to perform migration
	$ rake db:migrate

# to drop database
	$ rake db:drop

# to seed data into database
	$ rake db:seed

# to view current migration version
	$ rake db:version
"
end
