class CreateQuestionVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :question_votes do |t|
			t.integer :question_id
			t.integer :vote, default:0

			t.timestamps null: false
		end
	end
end
