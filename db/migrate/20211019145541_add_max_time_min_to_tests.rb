class AddMaxTimeMinToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :max_time_min, :integer, default: 0
  end
end
