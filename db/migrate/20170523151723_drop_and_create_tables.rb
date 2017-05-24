class DropAndCreateTables < ActiveRecord::Migration[5.0]
	def change
    drop_table :question_votes
    drop_table :answer_votes
        create_table :question_votes do |t|
            t.string :value
            t.references :user
            t.references :question
            t.timestamps
        end
    create_table :answer_votes do |t|
            t.string :value
            t.references :user
            t.references :answer
            t.timestamps
    end
	end
end
