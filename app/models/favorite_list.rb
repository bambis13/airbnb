class FavoriteList < ApplicationRecord
  has_many   :favorites
  belongs_to :user
end
