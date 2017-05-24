class Question < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  has_many :answers
end
