class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :text
			t.integer :user_id
			t.integer :question_id
		end
	end
end
