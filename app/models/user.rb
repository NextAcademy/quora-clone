class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Your email is invalid." }
  before_create :set_full_name

  def set_full_name
      self.full_name = "#{@last_name}, #{@first_name}"
  end
end
