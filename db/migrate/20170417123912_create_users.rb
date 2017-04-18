class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |x|
			x.string :fullname
			x.string :email
			x.string :password_digest

			x.timestamps 
		end
	end
end
