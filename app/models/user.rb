class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness:true, format: { with: VALID_EMAIL_REGEX } 
	validates :full_name, presence:true
	validates_length_of :password, minimum: 8
	has_secure_password
	
end
