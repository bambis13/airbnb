class Currency < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :homes
end
