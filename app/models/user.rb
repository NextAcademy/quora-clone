# :: means that Base is a module within AR 
class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :full_name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Please provide a valid email." }
	validates :password, presence: true, length: { in: 8..20, wrong_length: "Only 8-20 characters is allowed"  }
	has_secure_password
end
