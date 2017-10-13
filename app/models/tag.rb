class Tag <ActiveRecord::Base
	has many :question_tags
	has many :questions,  through: :question_tags
end