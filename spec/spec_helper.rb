# This is a spec helper. It handles common operations for all spec files.
# All spec files need to include this helper in order to run properly.
# To include, simply use:
# 			require 'spec_helper'
# Or you can generate the spec file using the following command:
# 			$ bundle exec rake generate:spec NAME=test_name

# Requiring test environment file
require File.expand_path("../../config/environments/test", __FILE__)

# Include racks test methods
include Rack::Test::Methods