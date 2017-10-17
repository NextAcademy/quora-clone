class Question <ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :questionvote
	
	def votes
		total= 0
		self.questionvote.each do |v|
			total = total + v.vote_type
		end
		return total
	end
	
end