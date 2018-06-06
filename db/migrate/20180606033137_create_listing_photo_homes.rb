class CreateListingPhotoHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photo_homes do |t|

      t.timestamps
    end
  end
end
