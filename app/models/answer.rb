class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	has_many :answer_votes
	# This is Sinatra! Remember to create a migration!
end
