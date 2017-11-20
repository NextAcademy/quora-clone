class AnswerVote < ActiveRecord::Base[5.0]
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user
	has_many :answer_votes
end
