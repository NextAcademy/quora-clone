class CreateAnswers < ActiveRecord::Migration[5.1]
	def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.string :detail
    end
	end
end
