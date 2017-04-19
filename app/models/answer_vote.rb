class AnswerVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :answer
	validates :user_id, uniqueness: {scope: :answer_id, message: "You have already voted for this answer!" }
end