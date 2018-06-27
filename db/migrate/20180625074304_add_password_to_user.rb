class AddPasswordToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password, :integer, null: false
  end
end
