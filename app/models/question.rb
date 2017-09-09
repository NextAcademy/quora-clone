class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	validates :title, presence: true
end


# Driver code
# question = Question.new(user_id: 1, title: 'What is life?')
# question.save
# question.errors.messages
