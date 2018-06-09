class Currency < ApplicationRecord
  has_many :users
  has_many :homes
end
