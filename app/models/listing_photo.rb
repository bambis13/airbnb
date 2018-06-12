class ListingPhoto < ApplicationRecord
  belongs_to              :user
  has_many                :homes, through: :listing_photos
end





