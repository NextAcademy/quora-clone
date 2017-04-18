class User < ActiveRecord::Base
	has_secure_password
	validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/,
  message: "password must be at least 6 characters and include one number and one letter" }, confirmation: true
	validates :first_name, :last_name, :email, :password, :password_confirmation, presence: { message: "field is required" }
	validates :email, format: { with: /\A[^@]+@[^@]+\z/,
  message: "invalid email address" }, uniqueness: { case_sensitive: false, message: "we already have an account for that email"}
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
end