require 'bcrypt'


class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  validates :email, uniqueness: true
  # validates :password_hash, presence: true
  # validates :password_hash, :length => { :minimum => 6, :maximum => 20 }
  validates :fullname, presence: true

  has_many :questions
  has_many :answers

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password_confirmation=(new_password)
    @password_confirmation = new_password
  end
end
