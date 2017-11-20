
class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password

	validates :email, presence: true
	validates :email, uniqueness: true

	has_many :answers
	has_many :questions
	has_many :question_votes
	has_many :answer_votes

end
