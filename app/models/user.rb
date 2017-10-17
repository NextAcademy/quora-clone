class User <ActiveRecord::Base
	has_many :questions
	has_many :answers
	has_many :questionvote
	has_many :answervote
has_secure_password
#this is a method inside gem bcrypt that allow user to encrpyt the password given, and able to authenticate it automatically.
validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
