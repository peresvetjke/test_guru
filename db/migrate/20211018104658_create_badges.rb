class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.text :title
      t.text :image_url
      t.references :rule, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
