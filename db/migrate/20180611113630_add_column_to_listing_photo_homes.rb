class AddColumnToListingPhotoHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :listing_photo_homes, :home, null: false, foreign_key: true
  end
end
