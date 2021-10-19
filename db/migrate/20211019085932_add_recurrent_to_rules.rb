class AddRecurrentToRules < ActiveRecord::Migration[6.1]
  def change
    add_column :rules, :recurrent, :boolean, default: false
  end
end
