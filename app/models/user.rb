class User < ActiveRecord::Base

    has_secure_password #its a method inside gem bcrypt that will encrypt your input password into password_digest


	# This is Sinatra! Remember to create a migration!
end
