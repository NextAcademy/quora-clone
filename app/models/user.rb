class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /(\w+.)?\w+@\w+\.\w{2,}/}
  has_many :answers
  has_many :questions
  has_many :question_votes
  has_secure_password
end
