class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :answer
			t.references :user
			t.references :question
			#t.integer :user_id, foreign_key: true, index: true
			t.timestamps
		end
	end
end
