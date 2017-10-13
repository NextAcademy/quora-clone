class QuestionTag <ActiveRecord::Base
	belong_to :tag
	belong_to :question
end