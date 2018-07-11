class ListingPhoto < ApplicationRecord
  belongs_to              :home

  enum    status: { main: 0, sub: 1 }
end





