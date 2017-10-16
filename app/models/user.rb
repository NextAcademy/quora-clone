class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  has_secure_password
  # this is a method inside gem bcrypt that allows user to encrypt the password given, and able to authenticate it automatically

  validates :email, uniqueness: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i), message: "format is incorrect*"}

  validates :first_name, presence: true

  validates :last_name, presence: true

  has_many :questions
  has_many :answers

end
