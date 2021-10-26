class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :questions, :current_question, null: true, foreign_key: {to_table: :questions}
      t.integer :correct_questions, default: 0
      t.boolean :passed

      t.timestamps
    end
  end
end
