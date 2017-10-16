class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  validates :question_content, presence: true, format: { with: (/\A.{6,}$\z/), message: "Please write better question*"}

# length: { minimum: 2 }

  belongs_to :user

  has_many :answers

end
