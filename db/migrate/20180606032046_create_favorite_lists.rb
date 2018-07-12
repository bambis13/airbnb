class CreateFavoriteLists < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_lists do |t|
      t.string     :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
