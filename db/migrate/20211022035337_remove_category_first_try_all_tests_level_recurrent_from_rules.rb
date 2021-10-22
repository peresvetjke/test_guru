class RemoveCategoryFirstTryAllTestsLevelRecurrentFromRules < ActiveRecord::Migration[6.1]
  def change
    remove_column :rules, :category_id
    remove_column :rules, :first_try
    remove_column :rules, :all_tests
    remove_column :rules, :level
    remove_column :rules, :recurrent
  end
end
