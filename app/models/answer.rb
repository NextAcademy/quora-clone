class Answer < ActiveRecord::Base
	validates :user_id, :question_id, :content, presence: true
end
