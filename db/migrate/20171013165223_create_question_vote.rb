class CreateQuestionVote < ActiveRecord::Migration[5.0]
	def change
		create_table :questionvotes do |t|
			t.integer :user_id
			t.integer :question_id
			t.timestamps
		end
	end
end

