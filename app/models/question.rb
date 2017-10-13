class Question <ActiveRecord::Base
	has many :answers
	has many :question_tags
	has many :tags,  through: :question_tags
	has many :question_votes
end