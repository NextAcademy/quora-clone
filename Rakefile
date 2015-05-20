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
			raise "Must specificy migration name, e.g., rake generate:spec NAME=user"
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
				require File.expand_path("../../config/environments/test", __FILE__)

				# Requiring test subject file. Uncomment below.
				# require_relative File.join(APP_CONTROLLER, "static")

				# Test cases
				describe '#{name}' do
					pending "pending test cases"
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

end


desc 'Initiate IRB console with environment loaded'
task "console" do
	exec "irb -r./config/environments/init"
end


desc 'Execute unit tests in spec'
RSpec::Core::RakeTask.new(:test)


desc 'default printout'
task :default do
	puts "
app instruction
===============
# performs all unit tests in spec folder.
	$ rake test

# initiate irb console for this web server
	$ rake console

# spec - to create unit test 'spec/<filename>_spec.rb' file
	$ rake generate:spec NAME=<filename>

# database - to create the database
	$ rake db:create

# database - to perform migration
	$ rake db:migrate

# database - to drop database
	$ rake db:drop
"
end
