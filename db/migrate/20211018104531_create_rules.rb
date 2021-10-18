class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.text :title
      t.references :category, null: false, foreign_key: true
      t.boolean :first_try
      t.boolean :all_tests
      t.integer :level

      t.timestamps
    end
  end
end
