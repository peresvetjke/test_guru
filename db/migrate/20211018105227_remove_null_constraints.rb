class RemoveNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :badges, :rule_id, true
  end
end
