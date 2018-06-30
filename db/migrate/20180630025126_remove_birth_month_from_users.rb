class RemoveBirthMonthFromUsers < ActiveRecord::Migration[5.1]
  def change
	remove_column :users, :birth_month, :integer
	remove_column :users, :birth_year, :integer
  end
end
