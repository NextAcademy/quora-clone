class User < ActiveRecord::Base
	validates :email, :password, presence: true
	validates :password, length: { in: 6..20 }
	validates :email, uniqueness: {case_sensitive: false, message: " Error: An account with this email already exists."}
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,message: "Error: Invalid email format."}
	# This is Sinatra! Remember to create a migration!

	has_secure_password # method inside gem bcrypt that alows user to encrypt tha password given, and able to authenticate it automatically

  has_many :questions
  has_many :answers

	
end

