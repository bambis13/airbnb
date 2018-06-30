class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :phone_number, nil
    change_column_default :users, :country_id, nil
    change_column_default :users, :currency_id, nil
    change_column_default :users, :language_id, nil
  end
end
