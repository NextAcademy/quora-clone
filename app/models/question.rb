class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :title, null:false
  validates :description, null:false

    belongs_to :user
    has_many :answers

end
