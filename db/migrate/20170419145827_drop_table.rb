class DropTable < ActiveRecord::Migration
	def change
		drop_table :QuestionVotes
	end
end
