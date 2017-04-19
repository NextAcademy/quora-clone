class QuestionVote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	# This is Sinatra! Remember to create a migration!
end
