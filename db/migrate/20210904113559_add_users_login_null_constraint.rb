class AddUsersLoginNullConstraint < ActiveRecord::Migration[6.1]
  # def change
  # end

  def up
    change_column_null :users, :login, false
  end

  def down
    change_column_null :users, :login, true
  end
end
