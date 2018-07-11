class Home < ApplicationRecord

  enum status: { visitor: 0, host: 1 }
  has_many                  :additional_home_rules, dependent: :destroy
  has_one                   :amenity              , dependent: :destroy
  has_one                   :bed_type             , dependent: :destroy
  has_one                   :available_space      , dependent: :destroy
  has_one                   :overview             , dependent: :destroy
  has_one                   :availability_setting , dependent: :destroy
  has_one                   :price                , dependent: :destroy
  has_one                   :home_rule            , dependent: :destroy
  has_one                   :additional_home_rule , dependent: :destroy
  has_one                   :home_notification    , dependent: :destroy
  has_one                   :cancel_policy        , dependent: :destroy
  has_many                  :listing_photos       , dependent: :destroy
  has_many                  :home_reservations    , dependent: :destroy 
  belongs_to                :home_category_sub
  belongs_to                :room_type
  belongs_to                :user
  belongs_to                :country
  belongs_to                :room_type
  belongs_to                :currency
  belongs_to                :home_category_sub

  accepts_nested_attributes_for :additional_home_rules, :amenity, :bed_type, :available_space, :overview, :availability_setting, :price, :home_rule, :additional_home_rule, :home_notification, allow_destroy: true, reject_if: :reject_additional_home_rules

  scope :sphost_home, -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }
  scope :random, ->{ order("RAND()") }

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def home_rules_children(params)
    HomeRule.where("accept_children> ?", paramas)
  end

  def calc_prices(params)
    price = {}
    stay_days = params[:days].to_i
    fixed_price = self.price.cleaning_fee + self.price.service_fee
    add_num = params[:guests_sum].to_i - self.price.additional_fee_from
    if add_num > 0
      per_day = self.price.default_price + (add_num * self.price.additional_fee_per_person)
    else
      per_day = self.price.default_price
    end
    variable_price = (per_day*stay_days)
    price[:total] = variable_price + fixed_price
    price[:per_day] = per_day
    price[:variable] = variable_price
    return price
  end

end
