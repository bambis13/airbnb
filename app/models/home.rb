class Home < ApplicationRecord
   enum status: { visitor: 0, host: 1 }
   has_one :amenity, :available_spaces, :overview
end
