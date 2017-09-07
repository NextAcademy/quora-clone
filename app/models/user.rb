require 'uri'

class User < ActiveRecord::Base
	validates :name, :email, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format!" }
	has_secure_password # also validates presence
	validates :password, length: { minimum: 6 }
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
