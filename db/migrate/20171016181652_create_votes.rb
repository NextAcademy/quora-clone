class CreateVotes < ActiveRecord::Migration[5.0]
	
	def change

		create_table :question_votes do |q|
     	q.references :question, index: true
      q.references :user, index: true
      q.integer :points, default: 0
      q.timestamps null: false
    end

    create_table :answer_votes do |a|
      a.references :answer, index: true
      a.references :user, index: true
      a.integer :points, default: 0
      a.timestamps null: false
    end
	
	end

end
