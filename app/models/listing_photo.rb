class ListingPhoto < ApplicationRecord
  belongs_to  :home,  dependent: :destroy

  enum    status: { main: 0, sub: 1 }
end





