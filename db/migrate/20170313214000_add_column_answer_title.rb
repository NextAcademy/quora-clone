class AddColumnAnswerTitle < ActiveRecord::Migration
	def change
    add_column :answers, :answer_title, :string
	end
end
