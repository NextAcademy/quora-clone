class Question < ActiveRecord::Base

	belongs_to :user

	 validates :title, presence: true, length: { maximum: 255 }

	 validates :question_description, presence: true

end
