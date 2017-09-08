class Question < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :answers
  # Validation
  validates :question, presence: true
end
