class CreateQuestions < ActiveRecord::Migration[5.0]
	
	def change

		create_table :questions do |t|

			t.references :users, index: true
			t.string :title
			t.text :question_description

			t.timestamps null: false

		end

	end

end
