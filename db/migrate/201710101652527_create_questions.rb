class CreateQuestions < ActiveRecord::Migration[5.0]
  def change

    create_table  :questions do |t|
      t.string  :question_description
      t.integer :answer_id
      t.integer  :user_id #you can also write t.references :user, index: true
      t.timestamps  null: false
    end

  end
end