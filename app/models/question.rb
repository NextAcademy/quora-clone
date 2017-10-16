class Question <ActiveRecord::Base
<<<<<<< HEAD
  has_many :answers
  belongs_to :user
=======
	has_many :answers
	has_many :question_tags
	has_many :tags,  through: :question_tags
	has_many :question_votes
>>>>>>> master
end