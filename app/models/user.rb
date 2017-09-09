require 'uri'
require 'byebug'

class User < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	validates :name, :email, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format!" }
	has_secure_password # also validates presence
	validates :password, length: { minimum: 6 }
	
	def self.authenticate(user_params)
		User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
	end
end


# Reference
# ==> Email validation
#     - http://yogodoshi.com/ruby-already-has-its-own-regular-expression-to-validate-emails/

# ==> bcrypt SecurePassword
#     - https://medium.com/@tpstar/password-digest-column-in-user-migration-table-871ff9120a5

# Driver code
# user = User.new(name: 'David', email: 'david', password: 'david')
# user.save
# user.errors.messages
