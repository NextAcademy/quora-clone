class Answer < ActiveRecord::Base
	validates :content, presence: true
end
