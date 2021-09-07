class ChangeAssessmentsPassedDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:assessments, :passed, false)
  end

  def down
    change_column_default(:assessments, :passed, nil)
  end
end
