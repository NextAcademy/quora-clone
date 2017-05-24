class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Not a valid email!" }
  validates :password, format:{ with: /(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}/, message: "Password does not meet requirements!"}
  has_many :questions
  has_many :answers

end
