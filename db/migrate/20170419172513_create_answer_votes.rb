class CreateAnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
			t.integer :answer_id, null: false
			t.integer :user_id, null: false
			t.boolean :vote_type
			t.timestamps
		end
	end
end
