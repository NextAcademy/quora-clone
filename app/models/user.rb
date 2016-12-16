require_relative 'user_validator'
class User < ActiveRecord::Base
  has_secure_password validations: false 
  validates :username, length: { minimum: 2 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 6 }

end








