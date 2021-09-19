class RemoveNullConstraintFromTestsAuthorId < ActiveRecord::Migration[6.1]
  def up
    change_column_null :tests, :author_id, true
  end

  def down
    change_column_null :tests, :author_id, false
  end
end
