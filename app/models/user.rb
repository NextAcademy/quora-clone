class User < ActiveRecord::Base[5.0]

  has_secure_password

	# This is Sinatra! Remember to create a migration!
  validates :user_id, uniqueness:true, presence:true, format: {with: /\@\w{2,}\./, message: "wrong email format"}
  validates :password, presence: true

  before_save do |user|
    # hash the password
  end


end
