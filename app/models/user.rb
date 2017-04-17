class User < ActiveRecord::Base

	validates :email, uniqueness: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
	validates :password, length: { minimum: 8 }
	has_secure_password

end