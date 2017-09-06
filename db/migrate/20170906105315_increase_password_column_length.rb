class IncreasePasswordColumnLength < ActiveRecord::Migration[5.1]
	def change
		change_column :users, :password_digest, :string, length: 100
	end
end
