class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :question_votes

	# validates :user_id, presence:true
	# validates :title, presense:true
	# This is Sinatra! Remember to create a migration!
end
