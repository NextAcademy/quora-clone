class CreateTags < ActiveRecord::Migration
	def change
		create_table :tags do |t|
			t.integer :question_id
			t.text :tag
			t.timestamps
		end
	end
end
