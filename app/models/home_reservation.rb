class HomeReservation < ApplicationRecord
  has_one    :home_review
  belongs_to :user
  belongs_to :home_review

  # validates :checkin_date,
  #           :checkout_date,
  #           :number_of_adults,
  #           :number_of_children,
  #           :number_of_babies,
  #           :service_fee,
  #           :cleaning_fee,
  #           :per_day_fee,
  #           :total_fee,
  #           :user_id,
  #           :home_id,
  #           presence: true
  # user_id|references|null: false, foreign_key: true
  # home_id|references|null: false, foreign_key: true
end
