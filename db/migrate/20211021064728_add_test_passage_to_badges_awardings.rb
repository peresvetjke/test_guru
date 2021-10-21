class AddTestPassageToBadgesAwardings < ActiveRecord::Migration[6.1]
  def change
    add_reference :badges_awardings, :test_passage, foreign_key: true, null: false
  end
end
