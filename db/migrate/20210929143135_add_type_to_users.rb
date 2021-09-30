class AddTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :text, default: 'User'
  end
end
