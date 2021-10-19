class RemoveActiveFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :active
  end
end
