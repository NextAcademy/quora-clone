class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user
	
	validates :user_id, presence: true, uniqueness: { scope: :answer_id }
	validates :answer_id, presence: true, uniqueness: { scope: :user_id }

end
