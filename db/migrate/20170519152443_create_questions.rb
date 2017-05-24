class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
      t.string :content
			t.references :user
			#t.integer :user_id, foreign_key: true, index: true
      t.timestamps
    end
	end
end
