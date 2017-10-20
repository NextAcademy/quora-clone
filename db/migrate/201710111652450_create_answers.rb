class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
			t.integer :question_id
			t.string :content
      t.timestamps  null: false
    end
  end
end