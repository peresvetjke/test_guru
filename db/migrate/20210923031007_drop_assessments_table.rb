class DropAssessmentsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :assessments, if_exists: true
  end
end
