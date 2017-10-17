class  CreateAnswerVote < ActiveRecord::Migration[5.0]
	def change
		create_table :answervotes do |t|
			t.integer :user_id
			t.integer :answer_id
			t.integer :vote_type
			t.timestamps
		end
	end
end
