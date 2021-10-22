class AddMethodAndValueToRules < ActiveRecord::Migration[6.1]
  def change
    add_column :rules, :method, :text
    add_column :rules, :value,  :text
  end
end
