class UndoAnswerVotesColumn < ActiveRecord::Migration
	def change
		rename_column :answer_votes, :question_id, :answer_id
	end
end
