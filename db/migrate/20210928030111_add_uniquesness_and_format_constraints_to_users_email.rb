class AddUniquesnessAndFormatConstraintsToUsersEmail < ActiveRecord::Migration[6.1]
  def up
    add_check_constraint :users, 'email LIKE "%@%"', name: 'emailchk'
    add_index :users, :email, unique: true
  end

  def down
    remove_check_constraint :users, name: 'emailchk'
    remove_index :users, :email
  end
end
