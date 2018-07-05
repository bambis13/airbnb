class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references  :favorite_list, null: false, foreign_key: true
     # t.references  :user_id,       null: false, foreign_key: true
     # t.references  :home_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
