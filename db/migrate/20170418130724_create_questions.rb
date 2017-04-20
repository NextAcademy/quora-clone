class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :text
			t.integer :user_id
			t.timestamps
		end
	end
end
