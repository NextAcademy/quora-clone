class AnswerVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :answer
	validates :user_id, :answer_id, presence: true
	validates :vote, inclusion: { in: [-1, 0, 1] }
	validate :vote_only_once, if: :user_voted

	def vote_only_once
		user = user_voted
		if upvoted?(user) && self.vote == 1
			errors.add(:vote, 'Already upvoted.')
		elsif downvoted?(user) && self.vote == -1
			errors.add(:vote, 'Already downvoted.')
		end
	end

	def user_voted
	  QuestionVote.find_by(user_id: self.user_id, question_id: self.question_id)
	end

	def upvoted?(user)
		user.vote == 1
	end

	def downvoted?(user)
		user.vote == -1
	end
end
