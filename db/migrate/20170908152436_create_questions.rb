class CreateQuestions < ActiveRecord::Migration[5.0]
	def up
    create_table :questions do |t|
    	t.belongs_to :user, index: true, foreign_key: true
    	t.string :title
    	t.timestamps
    end
	end

	def down
		drop_table :questions
	end
end
