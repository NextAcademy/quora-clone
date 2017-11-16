class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |x|

			x.string :email
			x.string :password_digest

			x.timestamp
		end
	end
end
