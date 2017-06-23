class User < ActiveRecord::Base
  # This is Sinatra! Remember to create a migration!
  # has_many :questions
  # has_many :answers
  has_secure_password

  validates :first_name, :last_name, presence: true, format: { with: /[a-zA-Z]/}

  validates :email, presence: true, uniqueness: true, :format => { :with => /([^@\s]+)@([\w]+)\.([a-zA-Z]{2,})/, :message => "Invalid email" }

  validates :password, length: { in: 6..10 }

end
