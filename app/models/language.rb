class Language < ApplicationRecord
  has_many :users, dependent: :nullify
end
