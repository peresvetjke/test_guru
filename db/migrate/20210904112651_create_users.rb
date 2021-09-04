class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :login
      t.text :email
      t.text :name
      t.text :surname

      t.timestamps
    end
  end
end
