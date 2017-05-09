class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :answer, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true
  # validate :one_answer_one_question
  # before_create :one_answer_one_question
  belongs_to :question
  belongs_to :user

  # def one_answer_one_question
  #   self.question.answers.each do |x|
  #     if x.user_id == self.user_id
  #       errors.add(:answer, "already answerd this question")
  #       return false
  #     end
  #   end
  # end

end
