class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :question_id, presence: true
	validates :user_id, presence: true
	validates :vote_type, presence: true
	#validate :upvote_count, :downvote_count
	#before_create :upvote_count, :downvote_count
	validates_uniqueness_of :user_id, scope: :question_id
	belongs_to :user
	belongs_to :question

	# def upvote_count
	#   votes.count(:conditions => "value = 1")
	# end

	# def downvote_count
	#   votes.count(:conditions => "value = 0")
	# end

end
