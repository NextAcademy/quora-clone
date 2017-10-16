class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|
			t.string :question_content
			t.integer :user_id

			t.timestamps
		end
	end
end
