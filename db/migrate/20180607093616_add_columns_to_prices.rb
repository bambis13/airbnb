class AddColumnsToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :cleaning_fee, :integer, null: false
    add_column :prices, :deposit, :integer, null: false
    add_column :prices, :additional_fee_per_person, :integer, null: false
  end
end
