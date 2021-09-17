class ChangeUsersEmailNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :email, false
  end

  def down
    change_column_null :users, :email, true
  end
end
