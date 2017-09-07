class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :name, presence: true
	validates :email, presence: true,
					  uniqueness: {message: 'Email has already been registered, try a different one'}
	has_secure_password
	validates :password, presence: {message: 'Password cannot be blank'},
						 length: {within: 8..20, message: 'Password length must be between 8 to 20'}
	validates_format_of :email, {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message:'Please make sure you enter a valid email'}
end