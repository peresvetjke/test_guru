class RemoveNullConstraintFromRulesCategoryId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :rules, :category_id, true
  end
end
