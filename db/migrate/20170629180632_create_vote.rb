
class CreateVote < ActiveRecord::Migration[4.2]
	def change
		create_table :voteanswers do |x|
			x.integer :a_count
			x.integer :user_id
			x.integer :answer_id
			x.timestamps
			end
		end
end