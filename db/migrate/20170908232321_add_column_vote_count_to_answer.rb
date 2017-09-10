class AddColumnVoteCountToAnswer < ActiveRecord::Migration[5.0]
	def change
    add_column :answers, :votes_count, :integer, :default => 0
	end
end
