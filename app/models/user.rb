class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email,
			presence: true,
			uniqueness: true,
			format: {with: /@\w{2,}\./,
				message: "wrong format"}
	validates :password, length: { minimum: 6 }
	has_secure_password
end
