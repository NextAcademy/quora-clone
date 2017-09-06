class AddNameAndRenameUserid < ActiveRecord::Migration[5.1]
	def change
		rename_column :users, :user_id, :email
		add_column :users, :full_name, :string
	end
end
