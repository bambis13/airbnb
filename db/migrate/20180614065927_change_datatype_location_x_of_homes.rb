class ChangeDatatypeLocationXOfHomes < ActiveRecord::Migration[5.1]
  def change
    change_column :homes, :location_x, :float
    change_column :homes, :location_y, :float
  end
end
