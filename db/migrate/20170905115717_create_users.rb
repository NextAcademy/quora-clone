class CreateUsers < ActiveRecord::Migration[5.1]
	def change
		create_table :users do |t|
			t.string :user_id, unique:true
			t.string :password, limit:20
		end
	end
end
