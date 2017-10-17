class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :question
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :question_id }
  validates :question_id, presence: true, uniqueness: { scope: :user_id }
  
end
