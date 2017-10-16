class CreateTags < ActiveRecord::Migration[5.0]
	def change
		create_table :tags do |t|
			t.string :tag_content

			t.timestamps
		end
	end
end
