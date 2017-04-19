class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :user_id, :answer_id, :vote_type, presence: true
	validates_uniqueness_of :user_id, scope: :answer_id

	belongs_to :answer
end
