class AddFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :favorite_list, null: false, foreign_key: true
  end
end
