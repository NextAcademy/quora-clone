class QuestionVote <ActiveRecord::Base
	validates :question_id, uniqueness: { scope: :user_id}
end