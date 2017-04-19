class RenameAnswerVotesColumn < ActiveRecord::Migration
	def change
		rename_column :answer_votes, :answer_id, :question_id
	end
end
