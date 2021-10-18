class AddNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :rules, :title, false
    change_column_null :badges, :title, false
    change_column_null :badges, :active, false
    change_column_default :badges, :active, false
  end
end
