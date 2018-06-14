class CreateListingPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photos do |t|
      t.text :image, null: false
      t.timestamps
    end
  end
end

# 進捗次第で追加するもの
# user_id|references|null: false, foreign_key: true
