class Country < ApplicationRecord
  has_many :homes, :users
end
