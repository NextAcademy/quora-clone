class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :question_id
			t.integer :user_id
			t.boolean :upvote
			t.timestamps
		end

	end
end
