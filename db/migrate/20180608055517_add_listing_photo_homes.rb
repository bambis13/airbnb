class AddListingPhotoHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :listing_photo_homes, :listing_photo, null: false, foreign_key: true
  end
end
