class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
		create_table :answers do |x|

			x.string :content
			x.references :user, foreign_key: true
			x.references :question, foreign_key: true

			x.timestamp
		end
	end
end
