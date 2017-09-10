class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	validates :user_id, :question_id, :content, presence: true
end
