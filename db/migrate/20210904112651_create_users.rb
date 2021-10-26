class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :login
      t.text :email, null: false
      t.text :name
      t.text :surname
      t.text :type, default: 'User'

      t.index :email, unique: true

      t.timestamps
    end

    add_reference :tests, :author, null: false, foreign_key: {to_table: :users}
  end
end
