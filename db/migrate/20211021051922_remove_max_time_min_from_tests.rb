class RemoveMaxTimeMinFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :max_time_min
  end
end
