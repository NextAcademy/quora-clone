class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :content, presence: true
end
