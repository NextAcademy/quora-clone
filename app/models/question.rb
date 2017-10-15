class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	belongs_to :user
	has_many :answers

	validates :description, presence: { message: "cannot be empty."}

end
