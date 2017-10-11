class User <ActiveRecord::Base
	has_secure_password
	validates :full_name, :email, :password_digest, presence: true
	validates :email, uniqueness: {case_sensitive: false, message: "this email has been used before"}
	validates :email, format: { with: /\w+@\w+\.\w+/,
    message: "only emails allowed" }
end