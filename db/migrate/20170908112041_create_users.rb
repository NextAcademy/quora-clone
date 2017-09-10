class CreateUsers < ActiveRecord::Migration[5.0]

	def change

		create_table :users do |column|

			column.string :first_name
			column.string :last_name
			column.string :email_address
			column.string :password_digest

			column.timestamps

		end

	end
end
