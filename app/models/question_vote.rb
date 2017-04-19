class QuestionVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	validates :user_id, uniqueness: {scope: :question_id, message: "You have already voted for this question!" }
end
