class User < ActiveRecord::Base
	has_secure_password
	validates :password, length: {in: 6..10}
	validates :user_email, presence: true
	validates :user_name, presence: true


end