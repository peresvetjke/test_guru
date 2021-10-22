class AddRecurrentToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :recurrent, :boolean, default: false
  end
end
