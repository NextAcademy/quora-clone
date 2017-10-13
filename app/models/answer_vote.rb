class AnswerVote <ActiveRecord::Base
	belong_to :user
	belong_to :answer

end