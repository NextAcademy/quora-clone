class User <ActiveRecord::Base
	has_secure_password

	validates :password, presence: true, format: {with: /\w{7}\w+/}
	validates :full_name, :email, presence: true
	validates :email, uniqueness: {case_sensitive: false, message: "this email has been used before"}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "only emails allowed" }
end
