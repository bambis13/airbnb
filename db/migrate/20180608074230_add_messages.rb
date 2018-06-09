class AddMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :user, null: false, foreign_key: true
  end
end
