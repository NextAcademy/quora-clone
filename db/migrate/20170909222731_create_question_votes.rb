class CreateQuestionVotes < ActiveRecord::Migration[5.0]
	def up
    create_table :question_votes do |t|
    	t.belongs_to :user, index: true, foreign_key: true
    	t.belongs_to :question, index: true, foreign_key: true
    	t.integer :vote
    	t.timestamps
    end
	end

	def down
		drop_table :question_votes
	end
end
