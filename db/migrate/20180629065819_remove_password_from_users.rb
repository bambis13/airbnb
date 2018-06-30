class RemovePasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
	remove_column :users, :password, :integer
  end
end
