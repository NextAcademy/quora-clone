class CreateDownvotes < ActiveRecord::Migration[5.0]
	def change
		create_table :downvotes do |t|
			t.integer :question_id
			t.integer :counter

			t.timestamps
		end
	end
end
