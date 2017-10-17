class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
	  create_table  :answers do |t|
	      t.string      :answer_description
	      t.integer     :user_id
	      t.integer     :question_id #you can also write t.references :user, index: true
	      t.timestamps  null: false
    	end

	end
end
