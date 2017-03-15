class User < ActiveRecord::Base
  before_save :set_full_name
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Your email is invalid." }
  before_create :set_full_name
  has_many :questions
  has_many :answers

  def set_full_name
      self.full_name = "#{self.last_name}, #{self.first_name}"
  end
end
