class AddPriceDetailToHomeReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :home_reservations, :integer, :accomodation_fee, null: false
    add_column :home_reservations, :integer, :clieaning_fee,    null: false
    add_column :home_reservations, :integer, :sevice_fee,       null: false
    add_column :home_reservations, :integer, :accomodation_fee, null: false
  end
end
