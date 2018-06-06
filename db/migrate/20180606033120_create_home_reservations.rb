class CreateHomeReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :home_reservations do |t|
      t.datetime :checkin_date, null: false
      t.datetime :checkout_date, null: false
      t.integer  :number_of_guests, null: false

      t.timestamps
    end
  end
end
