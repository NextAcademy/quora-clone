class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |x|

			x.string :full_name
			x.string :username
			x.string :email
			x.string :password
			x.integer :age
			x.integer :question_id
			x.integer :answer_id

			x.timestamp
		end
	end
end
