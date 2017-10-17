class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|
			t.integer :user_id
			t.string :question
			t.string :description
			t.timestamps
		end
	end
end
