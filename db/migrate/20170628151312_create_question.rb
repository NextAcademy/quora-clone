class CreateQuestion < ActiveRecord::Migration[4.2]
	def change
		create_table :questions do |x|
			x.string :question
			x.integer :user_id
			x.timestamps
		end
	end
end
