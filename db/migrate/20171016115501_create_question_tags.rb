class CreateQuestionTags < ActiveRecord::Migration[5.0]
	def change
    create_table :question_tags do |x|
      x.integer :question_id
      x.integer :tag_id
      x.timestamps
    end
	end
end
