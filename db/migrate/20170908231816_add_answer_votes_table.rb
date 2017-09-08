class AddAnswerVotesTable < ActiveRecord::Migration[5.0]
	def change
    create_table :answer_votes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true
      t.string :action
      t.timestamps
    end
	end
end
