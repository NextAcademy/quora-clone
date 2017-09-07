class ChangePasswordDigestLength < ActiveRecord::Migration[5.1]
	def change
    change_column :users, :password_digest, :string, :limit=>150
	end
end
