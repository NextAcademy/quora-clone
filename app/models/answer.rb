class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :text, presence: true, length: { in: 8..2000, wrong_length: "Only 8-20 characters is allowed" }
	validates :user_id, presence: true
	validates :question_id, presence: true

	belongs_to :user
	belongs_to :question
end
