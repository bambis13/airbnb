class AddPriceDetailToHomeReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :home_reservations, :accomodation_fee, :integer, null: false
    add_column :home_reservations, :cleaning_fee,    :integer, null: false
    add_column :home_reservations, :service_fee,       :integer, null: false
    add_column :home_reservations, :total_price,      :integer, null: false
  end
end
