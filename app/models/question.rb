class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :description, presence: true
	
end
