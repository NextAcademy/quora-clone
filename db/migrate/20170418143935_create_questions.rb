class CreateQuestions < ActiveRecord::Migration

	def change
		create_table :questions do |t|
			t.string :user_id
			t.string :title
			t.timestamps
		end

	end
end
