class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, default: 1
      t.text :reference
      t.references :category, null: false, foreign_key: true
      t.boolean :published, null: false, default: false

      t.index %i[title level], unique: true

      t.timestamps
    end
  end
end
