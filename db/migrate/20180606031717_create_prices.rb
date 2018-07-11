class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer     :pricing_method,            null: false
      t.integer     :default_price,             null: false
      t.integer     :cleaning_fee,              null: false
      t.integer     :service_fee,               null: false
      t.integer     :additional_fee_per_person, null: false
      t.integer     :additional_fee_from,       null: false
      t.boolean     :first_arrival_discount,    default: false
      t.float       :weekly_discount_rate,      null: false
      t.float       :monthly_discount_rate,     null: false
      t.references  :home,                      null: false, foreign_key: true, unique: true
      t.timestamps
    end
  end
end
