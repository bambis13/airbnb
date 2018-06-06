class HomeReservation < ApplicationRecord
  has_one :home_review
  belongs_to :user, :home_review

  # user_id|references|null: false, foreign_key: true
  # home_id|references|null: false, foreign_key: true

  def cal_accomdation_fee
    return Price.new
  end

  def cal_cleaning_fee
  end

  def cal_service_fee
  end

  def cal_total_price
  end
end
