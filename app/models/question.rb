class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :text, presence: true, length: { in:10..200, wrong_length: "Only 100-2000 characters is allowed"}
	validates :user_id, presence: true
	
	belongs_to :user
	has_many :answers
	has_many :question_votes
end
