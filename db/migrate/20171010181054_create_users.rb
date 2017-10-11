class CreateUsers < ActiveRecord::Migration[5.0]
	def change
		create_table :users do |x|
			x.string :email
			x.string :password_digest
			x.string :first_name
			x.string :last_name

			x.timestamps
	end
end
end