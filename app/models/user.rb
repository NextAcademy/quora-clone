class User < ActiveRecord::Base
  has_secure_password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :first_name,:last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum:7, too_short: "Password must be at least 7 characters long" }

  def self.authenticate(params)
    user = User.find_by(email:params[:user][:email])
    user.authenticate(params[:user][:password])
  end
end
