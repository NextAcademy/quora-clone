class AddUserIdToQuestionVotes < ActiveRecord::Migration[5.0]
	def change
		add_column :question_votes, :user_id, :integer
	end
end
