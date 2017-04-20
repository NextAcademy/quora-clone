class CreateQuestionVote < ActiveRecord::Migration
	def change
		create_table :QuestionVotes do |t|
			t.string :vote_type
			t.integer :user_id
			t.integer :question_id
			t.timestamps 
		end
	end
end
