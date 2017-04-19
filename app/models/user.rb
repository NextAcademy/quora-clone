class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

 	include BCrypt

  	def password
  		if @password.nil?
  			@password = Password.new(password_hash)
  		else
			@password  			
  		end

    	#puts "inside getter:{#@password}"
  	end

	def password=(new_password)
		#write_attribute(:password, Password.create(new_password))
		@password = Password.create(new_password)
		self.password_hash = @password
	end

end

# $ rake generate:model NAME=Url
# $ rake generate:migration NAME=create_urls