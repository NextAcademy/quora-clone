class Tag <ActiveRecord::Base
	has_many :question_tags
	has_many :questions,  through: :question_tags
end