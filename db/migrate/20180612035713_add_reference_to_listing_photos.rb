class AddReferenceToListingPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :listing_photos, :home, foreign_key: true
  end
end
