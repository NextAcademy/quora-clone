class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :question_id, null: false
			t.integer :user_id, null: false
			t.boolean :vote_type
			t.timestamps
		end	
	end
end
