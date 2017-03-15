class ChangeAnswersColumnName < ActiveRecord::Migration
	def change
    rename_column :answers, :question_text, :answer_text
	end
end
