class CreateAnswers < ActiveRecord::Migration
	def answers
		create_table :answers do |t|
			t.integer :user_id
			t.string :text
			t.string :text
		end
	end
end
