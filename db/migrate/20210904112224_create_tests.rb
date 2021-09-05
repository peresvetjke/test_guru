class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title
      t.integer :level
      t.text :reference
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
