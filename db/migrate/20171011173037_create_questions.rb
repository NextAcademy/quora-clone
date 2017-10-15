class CreateQuestions < ActiveRecord::Migration[5.0]
	
	def change	
		
		create_table :questions do |t|	
			t.integer :user_id	#or t.references :user, index: true
			t.text :description
			t.timestamps null: false
		end
	
	end		

end			

