class User < ActiveRecord::Base
	has_secure_password #this is a method inside gem bcrypt that allows users to encrypt the password given, and able to authenticate it automatically
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end