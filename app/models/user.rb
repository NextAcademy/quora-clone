class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	validates :email, :password_digest, :username, presence: true
	validates :email, :username, uniqueness: true
end
