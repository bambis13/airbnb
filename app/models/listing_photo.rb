class ListingPhoto < ApplicationRecord
<<<<<<< HEAD
  belongs_to              :user
  has_many                :listing_photo_homes
  has_many                :homes, through: :listing_photo_homes
end





