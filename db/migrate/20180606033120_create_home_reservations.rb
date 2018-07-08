class CreateHomeReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :home_reservations do |t|
      t.date       :checkin_date,       null: false
      t.date       :checkout_date,      null: false
      t.integer    :number_of_adults,   null: false, default: 1
      t.integer    :number_of_children, null: false, default: 0
      t.integer    :number_of_babies,   null: false, default: 0
      t.integer    :service_fee,        null: false
      t.integer    :cleaning_fee,       null: false
      t.integer    :per_day_fee,        null: false
      t.integer    :total_fee,          null: false
      t.references :user,               null: false
      t.references :home,               null: false
      t.timestamps
    end
    add_index  :home_reservations, [:checkin_date, :checkout_date], unique: true
  end
end
