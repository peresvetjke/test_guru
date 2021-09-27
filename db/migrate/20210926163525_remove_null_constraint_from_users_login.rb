class RemoveNullConstraintFromUsersLogin < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :login, null: true
  end
end
