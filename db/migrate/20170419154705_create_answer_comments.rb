class CreateAnswerComments < ActiveRecord::Migration
	def change
		create_table :answer_comments do |t|
			t.belongs_to :user, index: true
			t.belongs_to :answer, index: true
			t.string :comment
			t.timestamps
		end 
	end
end
