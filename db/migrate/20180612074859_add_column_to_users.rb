class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superhost, :integer, default: 0
  end
end
