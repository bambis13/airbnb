class HomeReservation < ApplicationRecord
  has_one    :home_review
  belongs_to :user
  belongs_to :home

  # validates :checkout_date,
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
  scope :only_dates,->{ select("checkin_date,checkout_date")}
  scope :with_checkout_later,->(date){ where "checkout_date > ?",date }
  scope :with_checkin_date_between,->(shortest_checkout_date, longest_checkout_date){where "? <= checkin_date and checkin_date < ?", shortest_checkout_date, longest_checkout_date}
end
