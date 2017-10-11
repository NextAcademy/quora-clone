class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	
	has_secure_password
     validates :email, presence: true
	 validates :email, uniqueness: {case_sensitive: false, message: "was used before"}
	 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	 validates :password, presence: true
	 validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}/, message:"should be more than six digits in length and contain both letters and numbers"}
	 

end
