class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_create :name
	has_secure_password
	validates :first_name, presence: true, uniqueness: { case_sensitive: true }#, format: { with: /[A-Z]/}
	validates :last_name, presence: true, uniqueness: { case_sensitive: true }#, format: { with: /[A-Z]/}
	validates :email, presence: true#, uniqueness: true, format: { with: /.{4,15}@.+\..+[^\!\~\`\#\$\%\^\&\*|(\)\-\=\+\_\\\|\[\]\{\}\;\:\'\"\/\.\,\@\s]/}
	validates :password, presence: true#, format: { with: /[a-zA-Z]0-9|[^\!\~\`\#\$\%\^\&\*|(\)\-\=\+\_\\\|\[\]\{\}\;\:\'\"\/\.\,\@\s].{6,8}/}

	 def name
	 	self.name = "#{first_name} #{last_name}" 
	 end

	 def verify(password)
	 	if self.try(:authenticate, password) #or user.authenticate(params["password"])
	 		return true
	 	end
	 end
end
