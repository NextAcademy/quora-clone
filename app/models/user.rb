class User < ActiveRecord::Base[5.0]
	# This is Sinatra! Remember to create a migration!'

  has_secure_password
  # this is a method inside gem bcrypt that allows user to encrypt the password given, and able to authenticate it automatically

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  def for_fun
    puts "github test for fun"
  end
end
