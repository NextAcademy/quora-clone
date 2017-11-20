class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |x|

			x.string :title
			x.string :content
			x.references :user, foreign_key: true			

			x.timestamp
		end
	end
end
