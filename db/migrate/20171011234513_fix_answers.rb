class FixAnswers < ActiveRecord::Migration[5.0]
  def change
	add_column(:answers, :user_id, :integer)
  end
end
