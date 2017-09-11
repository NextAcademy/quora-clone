class CreateQuestions < ActiveRecord::Migration[5.1]
	def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :header, :limit=>100
      t.string :detail, :limit=>2000
    end
	end
end
