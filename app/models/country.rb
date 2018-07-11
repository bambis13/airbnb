class Country < ApplicationRecord
  has_many :homes,  dependent: :nullify
  has_many :users,  dependent: :nullify
end
