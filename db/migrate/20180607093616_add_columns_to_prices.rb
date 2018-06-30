class AddColumnsToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :cleaning_fee, :integer, null: false
    # add_column :prices, :service_fee, :integer, null: false
    add_column :prices, :additional_fee_per_person, :integer, null: false
    # add_column :prices, :additional_fee_from, :integer, null: false
  end
end
