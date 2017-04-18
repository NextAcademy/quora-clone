class CreateUsers< ActiveRecord::Migration


	def change
		create_table :users do |t|
			t.string :fullname
			t.string :email
			t.string :password_hash

			t.timestamp
	end


end
