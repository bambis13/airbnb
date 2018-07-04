class HomeReservation < ApplicationRecord
  has_one    :home_review
  belongs_to :user
  belongs_to :home_review

  # user_id|references|null: false, foreign_key: true
  # home_id|references|null: false, foreign_key: true
end
