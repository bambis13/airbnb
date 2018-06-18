class CreateHomeReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :home_reservations do |t|
      t.datetime :checkin_date, null: false
      t.datetime :checkout_date, null: false
      t.integer  :number_of_adults, null: false, default: 1
      t.integer  :number_of_kids, null: false, default: 0
      t.integer  :number_of_babies, null: false, default: 0
      t.integer  :service_fee, null: false
      t.integer  :service_fee,  null: false
      t.integer  :default_fee,  null: false
      t.integer  :additional_guests_fee, null: false
      t.integer  :cleaning_fee, null: false
      t.integer  :service_fee, null: false
      t.integer  :total_fee, null: false
      t.references :user, null: false
      t.references :home, null: false
      t.timestamps
    end
  end
end
