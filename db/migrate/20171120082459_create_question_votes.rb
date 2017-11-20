class CreateQuestionVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :question_votes do |x|

			x.integer :question_vote, default: 0
			x.references :user, foreign_key: true
			x.references :question, foreign_key: true

			x.timestamp 
		end
	end
end
