class CreateHomeReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :home_reviews do |t|
      t.text       :review,                null: false
      t.integer    :accuracy_rate,         null: false
      t.integer    :location_rate,         null: false
      t.integer    :communication_rate,    null: false
      t.integer    :cleanliness_rate,      null: false
      t.integer    :checkin_rate,          null: false
      t.integer    :cost_performance_rate, null: false
      t.references :home_reservations
      t.references :user
      t.references :home
      t.timestamps
    end
  end
end
