class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, references: :users, index: true, null: false
    add_foreign_key :tests, :users, column: :author_id
  end
end
