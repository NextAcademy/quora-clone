class User < ActiveRecord::Base
	validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Only valid email formats"}, uniqueness: true
	validates :password, length: { minimum: 6, message: "password must be more than 6 characters in length" }
	has_secure_password

	def authenticate_login(email, password)
	
		if email == User.find_by_email(email).email && password_digest == User.find_by_email(email).password_digest
			return true
		else
			return false
		end
	end

end
