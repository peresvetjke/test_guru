class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[6.1]
  # def change
  # end

  def up
    change_column_default(:answers, :correct, false)
  end

  def down
    change_column_default(:answers, :correct, nil)
  end
end
