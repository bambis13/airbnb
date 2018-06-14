class AddFavoriteLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorite_lists, :user, null: false, foreign_key: true
  end
end
