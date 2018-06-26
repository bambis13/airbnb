class HomeReservation < ApplicationRecord
  has_one    :home_review
  belongs_to :user
  belongs_to :home_review

  # user_id|references|null: false, foreign_key: true
  # home_id|references|null: false, foreign_key: true

  def total_price(home, stay_days, guests_sum)
    binding.pry
    stay_days = params[:days].to_i
    per_day = home.price.default_price
    fixed_price = home.price.cleaning_fee + home.price.service_fee
    total_price = (per_day*stay_days) + fixed_price
    add_num = params[:guests_sum].to_i - home.price.additional_fee_from
    if add_num > 0
      per_day += (add_num * home.price.additional_fee_per_person)
      total_price = (per_day*stay_days) + fixed_price
    else
      add_num = 0
    end
  end
end
