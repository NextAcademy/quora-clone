class CreateQuestions < ActiveRecord::Migration
	def questions
		create_table :questions do |t|
			t.integer :user_id
			t.string :text
			t.string :category
		end
	end
end
