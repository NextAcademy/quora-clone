class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :answer_id, presence: true
	validates :user_id, presence: true
	#validate :upvote_count, :downvote_count
	validates :user, uniqueness: { scope: :answer }
	#validates_uniqueness_of :user_id, scope: :answer_id
	belongs_to :user
	belongs_to :answer

	# def upvote_count
	#   votes.count(:conditions => "value = 1")
	# end

	# def downvote_count
	#   votes.count(:conditions => "value = 0")
	# end
end
