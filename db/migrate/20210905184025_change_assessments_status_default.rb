class ChangeAssessmentsStatusDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:assessments, :status, 0)
  end

  def end
    change_column_default(:assessments, :status, nil)
  end
end
