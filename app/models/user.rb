class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# validates :fullname, uniqueness: true
	validates :email, format: { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]{2,}+\z/ }
	validates :email, uniqueness: true
	validates :password, length: { minimum: 2 }
	has_secure_password


end
	# validates :phone, :format => { :with => /(.*(\d).*){10,}/ }