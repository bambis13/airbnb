class RemoveCleaningFeeToHomeReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :home_reservations, :cleaning_fee, :string
    remove_column :home_reservations, :service_fee, :string
  end
end
