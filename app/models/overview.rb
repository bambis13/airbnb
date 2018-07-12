class Overview < ApplicationRecord
  belongs_to :home,  dependent: :destroy
end
