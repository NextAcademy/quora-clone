class Answer < ActiveRecord::Base
  # Associations
	belongs_to :question
  belongs_to :user
  # Validation
  validates :answer, presence: true
end
