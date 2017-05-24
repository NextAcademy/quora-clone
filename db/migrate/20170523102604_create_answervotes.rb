class CreateAnswervotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answer_votes do |t|
			t.integer :answer_vote
			t.references :user
			t.references :answer
			t.timestamps
		end
	end
end
