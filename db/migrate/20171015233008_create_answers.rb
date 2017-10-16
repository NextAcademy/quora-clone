class CreateAnswers < ActiveRecord::Migration[5.0]

	def change

    create_table :answers do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.text :content
      t.timestamps null: false

    end

	end

end
