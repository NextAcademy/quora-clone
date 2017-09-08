class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :title, presence: true
  has_many :answers
end
