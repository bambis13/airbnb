class ChangeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :phone_number, true
    change_column_null :users, :country_id, true
    change_column_null :users, :currency_id, true
    change_column_null :users, :language_id, true
    change_column_null :users, :sex, true
    change_column_null :users, :postal_code, true
    change_column_null :users, :prefecture, true
    change_column_null :users, :town, true
    change_column_null :users, :street, true
    change_column_null :users, :building, true
    change_column_null :users, :self_introduction, true
    change_column_null :users, :status, true
  end
end
