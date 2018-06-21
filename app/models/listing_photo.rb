class ListingPhoto < ApplicationRecord
  belongs_to              :user
  belongs_to              :home

  mount_uploader :image, ImageUploader
end





