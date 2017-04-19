class CreateQuestionsAndAnswers < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.belongs_to	:user, index: true
			t.string			:text
			t.timestamps
		end

		create_table :answers do |t|
			t.belongs_to	:question, index: true
			t.belongs_to	:user, index: true
			t.string			:text
			t.timestamps
		end
	end
end
