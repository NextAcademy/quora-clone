class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	belongs_to :user
  belongs_to :question
  has_many :answer_votes, dependent: :destroy

  validates :content, presence: { message: "cannot be empty."}

end
