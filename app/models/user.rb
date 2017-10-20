class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :questions
  has_many :answers
	
	has_secure_password
	validates :email, presence: true
	validates :email, uniqueness: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i), message: "has registered before"}
end
