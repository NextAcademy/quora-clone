class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password

end
