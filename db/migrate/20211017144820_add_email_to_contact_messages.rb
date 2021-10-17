  class AddEmailToContactMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_messages, :email, :text, null: false
  end
end
