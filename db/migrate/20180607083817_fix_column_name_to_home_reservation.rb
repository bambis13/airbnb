class FixColumnNameToHomeReservation < ActiveRecord::Migration[5.1]
  def up
    add_column :home_reservations, :cleaning_fee, :integer, null: false
    add_column :home_reservations, :service_fee, :integer, null: false
  end

  def down
    remove_column :home_reservations, :clieaning_fee, :integer, null: false
    remove_column :home_reservations, :sevice_fee, :integer, null: false
  end
end
