class AddListingPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :listing_photos, :user, null: false, foreign_key: true
  end
end
