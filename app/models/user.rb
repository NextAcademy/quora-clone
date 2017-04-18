class User < ActiveRecord::Base
    validates :name, presence: true
	validates :email, uniqueness: true
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
	validates :password, length: 8..20

	has_secure_password

end

