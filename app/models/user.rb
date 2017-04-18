class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, uniqueness: true,  presence:true
	validates :email, length: { in: 6..30 }    # try changing to 30 instead when finished
	# validates :password, length: { in: 6..20 }    ----> has_secure_password does this
	has_secure_password
end

