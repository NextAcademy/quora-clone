class CreateAnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
		t.string :vote_type
		t.integer :user_id
		t.integer :answer_id
		t.timestamps 
		end
	end
end
