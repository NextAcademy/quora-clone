class Question < ActiveRecord::Base
	validates :title, presence: true
end


# Driver code
# question = Question.new(user_id: 1, title: 'What is life?')
# question.save
# question.errors.messages
