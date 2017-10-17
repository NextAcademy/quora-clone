class AnswerVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answer_votes do |t|
			t.integer :answer_id
			t.integer :vote, default:0

			t.timestamps null: false
		end
	end
end
