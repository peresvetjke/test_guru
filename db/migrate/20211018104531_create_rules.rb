class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.text :title, null: false
      t.text :method, null: false
      t.integer :rules, :value

      t.timestamps
    end
  end
end
