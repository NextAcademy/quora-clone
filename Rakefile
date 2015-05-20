require 'rake'
require 'rspec/core/rake_task'

# Include environment settings
require ::File.expand_path('../config/environments/init', __FILE__)

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

"
end
