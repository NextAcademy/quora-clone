class CreateQuestionvotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :question_vote
			t.references :user
			t.references :question
			t.timestamps
		end
	end
end
