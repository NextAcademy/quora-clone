class QuestionVote <ActiveRecord::Base
	validates :question_id, uniqueness: { scope: :user_id}
	belongs_to :user
	belongs_to :question 
end