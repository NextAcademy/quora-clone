class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :username, presence:true
	validates :email, uniqueness: true,  presence:true
	validates :email, length: { in: 6..30 }    # try changing to 30 instead when finished
	# validates :password, length: { in: 6..20 }    ----> has_secure_password does this
	has_secure_password


def self.email_password_matches?(email,password)
		user = User.find_by(email:email)
		return nil if user.nil?
		return "Wrong sign-in info." if !user.authenticate(password)
		return user
	end
end