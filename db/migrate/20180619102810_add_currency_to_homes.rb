class AddCurrencyToHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :homes, :currency, foreign_key: true
  end
end
