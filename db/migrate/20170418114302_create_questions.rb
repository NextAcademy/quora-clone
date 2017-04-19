class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title, null: false
			t.string :description
			t.integer :user_id, null: false
		end
			add_foreign_key :questions, :users
	end
end
