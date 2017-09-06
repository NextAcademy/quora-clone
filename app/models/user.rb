class User < ActiveRecord::Base

  has_secure_password

	# This is Sinatra! Remember to create a migration!
  validates :email,
            uniqueness:{message: 'This username has been taken'},
            presence:true,
            format: {with: /\@\w{2,}\.[a-z]+/, message: "wrong email format"}

  validates :password,
            presence: {message: 'password cannot be blank!'},
            length: {in: 8..30, message: "password length must between 8 to 30"}

end
