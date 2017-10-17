class AddVoteTypeToQuestionvotes < ActiveRecord::Migration[5.0]
	def change
 		add_column :questionvotes, :vote_type, :integer
	end
end
