class QuestionVote <ActiveRecord::Base
	validates :question_id, uniqueness: { scope: :user_id}
	belong_to :user
	belong_to :question 
end