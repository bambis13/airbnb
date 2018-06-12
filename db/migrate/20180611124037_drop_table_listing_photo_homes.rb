class DropTableListingPhotoHomes < ActiveRecord::Migration[5.1]
  def change
    drop_table :listing_photo_homes
  end
end
