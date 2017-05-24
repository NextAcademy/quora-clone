class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :answer, presence: true
  belongs_to :user
  belongs_to :question
end
