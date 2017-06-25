class CreateQuestions < ActiveRecord::Migration[4.2]
  def change
    create_table :questions do |t|
      t.references :user
      t.string :subject
      t.string :description
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
