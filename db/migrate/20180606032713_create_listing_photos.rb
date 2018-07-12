class CreateListingPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photos do |t|
      t.text       :image,  null: false
      t.integer    :status, null: false
      t.references :home,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
