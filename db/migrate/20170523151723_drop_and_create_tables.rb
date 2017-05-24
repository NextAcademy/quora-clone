class DropAndCreateTables < ActiveRecord::Migration
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
