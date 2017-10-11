class CreateTags < ActiveRecord::Migration[5.0]
	def change
		create_table :tags do |t|
			t.integer :question_id
			t.string :content

			t.timestamps
		end
	end
end
