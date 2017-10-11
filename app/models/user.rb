class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	
	has_secure_password

	 

	 validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
