class CreateAnswers < ActiveRecord::Migration[5.0]
	def up
    create_table :answers do |t|
    	t.belongs_to :user, index: true, foreign_key: true
    	t.belongs_to :question, index: true, foreign_key: true
    	t.string :content
    	t.timestamps
    end
	end

	def down
		drop_table :answers
	end
end
