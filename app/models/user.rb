class User < ActiveRecord::Base

  has_secure_password
  has_many :questions
  has_many :answers

	# This is Sinatra! Remember to create a migration!
  validates :user_id,
            uniqueness:true,
            presence:true,
            format: {with: /\@\w{2,}\./, message: "wrong email format"}

  validates :password,
            presence: true,
            length:{in: 8..30, message: "password length must be in between 8 and 30"}

end
