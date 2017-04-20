class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :user_id, :question_id, :vote_type, presence: true
	validates_uniqueness_of :user_id, scope: :question_id

	belongs_to :question
end
