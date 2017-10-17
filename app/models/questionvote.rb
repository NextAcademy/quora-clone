class Questionvote <ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :user_id, uniqueness: { scope: :question_id, message: "can only vote once per question"}

end
