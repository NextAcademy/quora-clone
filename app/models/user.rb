class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_many :questions
  has_many :answers
  
	has_secure_password

	validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false, message: " has already been registered with Quora." }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, presence: true,
                       confirmation: true,
                       length: { in: 8..12, message: " must be between 8 to 12 characters in length." },
                       on: :create



   def self.authenticate(params)
 			@user = User.find_by(email: params[:email])
			return @user if @user && @user.authenticate(params[:password])

			return nil
		
		end

end
