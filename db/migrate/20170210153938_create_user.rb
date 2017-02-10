class CreateUser < ActiveRecord::Migration
	def user
		create_table :users do |t|
			t.string :email
			t.integer :password
		end
	end
end
