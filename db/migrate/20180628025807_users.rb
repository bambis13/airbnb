class Users < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :sex, nil
    change_column_default :users, :postal_code, nil
    change_column_default :users, :prefecture, nil
    change_column_default :users, :town, nil
    change_column_default :users, :street, nil
    change_column_default :users, :building, nil
    change_column_default :users, :self_introduction, nil
    change_column_default :users, :status, nil
  end
end
