class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.belongs_to :user, index: true
			t.belongs_to :question, index: true
			t.string :vote
			t.timestamps
		end
	end
end
