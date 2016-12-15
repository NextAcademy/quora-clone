class User < ActiveRecord::Base
  validates :username, length: { minimum: 2 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true 
  validates :password_digest, confirmation: true,  presence: true, length: { in: 8..15 }
  # validates :password_confirmation, presence: true 
end




class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
 