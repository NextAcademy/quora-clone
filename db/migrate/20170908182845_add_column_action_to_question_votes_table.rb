class AddColumnActionToQuestionVotesTable < ActiveRecord::Migration[5.0]
	def change
    add_column :question_votes, :action, :string
	end
end
