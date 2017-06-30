class CreateAnswer < ActiveRecord::Migration[4.2]
	def change
		create_table :answers do |x|
			x.string :answer
			x.integer :user_id
			x.integer :question_id
			x.timestamps
		end
	end
end
