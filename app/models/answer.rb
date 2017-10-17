class Answer <ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :answervote

	def votes
		
		total= 0
		self.answervote.each do |v|
			total = total + v.vote_type
		end
		return total
	end
end