class Question < ActiveRecord::Base
		
	# validates :email_address, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
	# message: "Email format invalid, please follow example: johndoe@example.com"}, uniqueness: true

	# validates :first_name, presence: true

	# validates :last_name, presence: true

	# has_secure_password

	# validates :password, length: { minimum: 8, message: "Password must be at least 8 characters"}, allow_nil: true


	# def self.authenticate(options={})

	# 	@user = User.find_by(email_address: options[:email_address])
		
	# 		if @user != nil

	# 			return @user.id if @user.authenticate(options[:password]) != false
	# 			return "password_invalid" if @user.authenticate(options[:password]) == false

	# 		else 

	# 			return "email_invalid"

	# 		end

	# end 

end
