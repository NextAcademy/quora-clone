class AddUserIdToAnswerVotes < ActiveRecord::Migration[5.0]
	def change
		add_column :answer_votes, :user_id, :integer
	end
end
