class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :question
	
# 	def upvoted?
#     true if self.vote == 1
#   end

#   def downvoted?
# 		true if self.vote == -1
# 	end

#   def change_vote
#     if self.vote == 1
#       self.update(vote: -1)
#     else
#       self.update(vote: 1)
#     end
#   end

# end
end
