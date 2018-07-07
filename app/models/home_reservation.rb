class HomeReservation < ApplicationRecord
  include HomeReservationsHelper

  has_one    :home_review
  belongs_to :user
  belongs_to :home

  scope :only_dates,->{ select("checkin_date,checkout_date")}
  scope :with_checkout_later,->(date){ where "checkout_date > ?",date }
  scope :with_checkin_date_between,->(shortest_checkout_date, longest_checkout_date){where "? <= checkin_date and checkin_date < ?", shortest_checkout_date, longest_checkout_date}

  validates :checkin_date,
            :checkout_date,
            :number_of_adults,
            :number_of_children,
            :number_of_babies,
            :service_fee,
            :cleaning_fee,
            :per_day_fee,
            :total_fee,
            :user_id,
            :home_id,
            presence: true

  validate :dates_cannot_be_in_the_past,on: :create
  validate :make_sure_not_double_booking,on: :create
  validate :guests_sum_cannot_over_capacity,on: :create
  validate :total_fee_must_be_calculated_correctly,on: :create

  def dates_cannot_be_in_the_past
    if checkin_date.present? && checkin_date < Date.today
      errors.add(:checkin_date, ": 過去の日付は使用できません")
    end

    if checkout_date.present? && checkout_date < Date.today
      errors.add(:checkout_date, ": 過去の日付は使用できません")
    end
  end

  def make_sure_not_double_booking
    booked_dates = generate_disable_dates(home.home_reservations, home.availability_setting.minimum_accomodation_range)
    booked_dates.each do |date|
      errors.add(:checkin_date, ": すでに予約が入っています") if date == checkin_date.to_s
      errors.add(:checkout_date, ": すでに予約が入っています") if date == checkout_date.to_s
    end
  end

  def guests_sum_cannot_over_capacity
    capacity   = home.capacity
    guests_sum = number_of_adults + number_of_children
    errors.add(:number_of_adults, ": 一度に宿泊可能な人数は最大#{capacity}人です") if guests_sum > capacity
  end

  def total_fee_must_be_calculated_correctly
    stay_days      = calc_stay_days(checkin_date, checkout_date)
    guests_sum     = number_of_adults + number_of_children
    params         = {days: stay_days, guests_sum: guests_sum}
    expected_price = home.calc_prices(params)
    errors.add(:total_fee, ": 金額に誤りがあります") unless total_fee == expected_price[:total]
  end

  def calc_guests_sum(adults_num,children_num)
    return adults_num + children_num
  end

end
