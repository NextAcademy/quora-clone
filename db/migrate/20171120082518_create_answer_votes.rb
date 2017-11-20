class CreateAnswerVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answer_votes do |x|

			x.integer :answer_vote, default: 0
			x.references :user, foreign_key: true
			x.references :answer, foreign_key: true

			x.timestamp
		end
	end
end
