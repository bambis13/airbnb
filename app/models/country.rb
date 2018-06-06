class Country < ApplicationRecord
  has_many :homes
  has_many :users
end
