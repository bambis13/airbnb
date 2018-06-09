class CreateListingPhotoHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photo_homes do |t|

      t.timestamps
    end
  end
end

# 進捗次第で追加するもの
# home_id|references|null: false, foreign_key: true
# listing_photo_id|references|null: false, foreign_key: true
