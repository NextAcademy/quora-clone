class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
	# This is Sinatra! Remember to create a migration!
  validates :header, presence: true, length:{maximum: 100, message:"Question header must be less than 100 characters"}
  validates :detail, length:{maximum: 1000, message: "Question detail must be less than 1000 characters"}


end
