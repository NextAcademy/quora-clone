class QuestionVote < ActiveRecord::Base
	validates :user_id, :question_id, presence: true
	validates :vote, inclusion: { in: [1, -1] }
end


# vote = QuestionVote.new(user_id: 2, vote: 1)