# Requiring test environment file
require 'spec_helper'

# Requiring test subject file
require_relative File.join(APP_CONTROLLERS, "static")

# Test cases
describe 'Routing for root' do
	it "has ok response when get '/' is called." do
		get '/'
		expect(last_response).to be_ok
	end
end