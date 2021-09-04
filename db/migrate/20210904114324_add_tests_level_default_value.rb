class AddTestsLevelDefaultValue < ActiveRecord::Migration[6.1]
  # def change
  # end

  def up
    change_column_default(:tests, :level, 1)
  end

  def down
    change_column_default(:tests, :level, nil)
  end
end
