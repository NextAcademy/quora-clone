class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness:true, format: { with: VALID_EMAIL_REGEX } 
	validates :full_name, presence:true
	validates_length_of :password, minimum: 6
	has_secure_password
	
	def self.email_password_matches?(email,password)
		user = User.find_by(email:email)
		return nil if user.nil?
		return "Wrong sign-in info." if !user.authenticate(password)
		return user
	end
end
