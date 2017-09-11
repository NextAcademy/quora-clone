class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	validates :user_id, :title, presence: true
end


# Driver code
# question = Question.new(user_id: 1, title: 'What is life?')
# question.save
# question.errors.messages
