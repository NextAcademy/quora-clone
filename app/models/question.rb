class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	# This is Sinatra! Remember to create a migration!
end
