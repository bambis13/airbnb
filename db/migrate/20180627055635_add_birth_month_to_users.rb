class AddBirthMonthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_month, :integer, null: false
    add_column :users, :birth_year, :integer, null: false
  end
end
