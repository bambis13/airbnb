class HomeReview < ApplicationRecord
  belongs_to :home
  belongs_to :user
  belongs_to :home_reservation

  # user_id|references|null: false
  # home_id|references|null: false, foreign_key: true
  # home_reservation_id|references|null: false
end
