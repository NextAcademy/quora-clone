class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :text, presence: true, length: { in: 100..2000, wrong_length: "Only 100-2000 characters is allowed"}
	validates :user_id, presence: true
	
	has_one :user
	has_many :answers
end
