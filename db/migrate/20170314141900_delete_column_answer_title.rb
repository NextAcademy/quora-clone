class DeleteColumnAnswerTitle < ActiveRecord::Migration
	def change
		remove_column :answers, :answer_title
	end
end
