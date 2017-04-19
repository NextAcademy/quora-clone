class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	 validates :title, presence: true
	 validates :user_id, presence: true
	 belongs_to :user
	 has_many :answers

	 # before_create do 
		# self.click_count = counter
	 # end

  #    def counter
  #   	self.click_count = 0
  #    end	
end
