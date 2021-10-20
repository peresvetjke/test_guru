class RemoveAllTestsFromRules < ActiveRecord::Migration[6.1]
  def change
    remove_column :rules, :all_tests
  end
end
