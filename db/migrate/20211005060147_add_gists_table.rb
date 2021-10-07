class AddGistsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :github_gist_id, null: false

      t.timestamps
    end
  end
end
