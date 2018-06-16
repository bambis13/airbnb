class AddColumnsToHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :homes, :home_category_sub, foreign_key: true
    add_reference :homes, :country,           foreign_key: true
    add_reference :homes, :room_type,         foreign_key: true
    add_reference :homes, :currency,          foreign_key: true
  end
end
