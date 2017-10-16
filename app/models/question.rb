class Question <ActiveRecord::Base
	has_many :answers
	has_many :question_tags
	has_many :tags,  through: :question_tags
	has_many :question_votes
end