class Question < ActiveRecord::Base
  # This is Sinatra! Remember to create a migration!
  belongs_to :user

  validates :subject, presence: true, length: { in: 3..50 }
  validates :description, presence: true

end
