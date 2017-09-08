class AddColumnVoteCountToQuestion < ActiveRecord::Migration[5.0]
	def change
    add_column :questions, :votes_count, :integer, :default => 0
	end
end
