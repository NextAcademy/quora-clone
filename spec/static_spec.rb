# Requiring test environment file
require 'spec_helper'

# Requiring test subject file
require_relative File.join(APP_CONTROLLERS, "static")

require_relative File.join(APP_MODELS,'user')

# Test cases
describe 'Routing for root' do
	it "has ok response when get '/' is called." do
		get '/'
		expect(last_response).to be_ok
	end
end

describe 'create user' do
  it "should not accept invalid email" do
    email = 'khun84@gmail.123'
    password = '1234578'
    user = User.new(email: email, password:password)
    user.save

    expect(user.errors.messages[:email][0]).to eq 'Wrong email format'
  end

  it 'should not accept invalid password' do
    email = 'khun84@gmail.com'
    password = '1234'
    user = User.new(email: email, password: password, password_confirmation: false)
    # user[:password_confirmation] = false
    user.save

    expect(user.errors.messages[:password][0]).to eq 'password length must between 8 to 30'
  end

end