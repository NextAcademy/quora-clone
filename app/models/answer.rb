class Answer <ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :question
  belongs_to :user
=======
	belongs_to :question
	belongs_to :user
	has_many  :answer_votes
>>>>>>> master
end