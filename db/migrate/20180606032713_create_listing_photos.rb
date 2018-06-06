class CreateListingPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photos do |t|
      t.text :image, null: false
      t.timestamps
    end
  end
end
