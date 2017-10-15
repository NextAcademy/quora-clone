class AnswerVote <ActiveRecord::Base
	belongs_to :user
	belongs_to :answer

end