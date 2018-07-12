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

  accepts_nested_attributes_for :additional_home_rules,
                                :amenity,
                                :bed_type,
                                :available_space,
                                :overview,
                                :availability_setting,
                                :price,
                                :home_rule,
                                :additional_home_rule,
                                :home_notification,
                                allow_destroy: true,
                                reject_if: :reject_additional_home_rules

  scope :sphost_home,   -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }
  scope :random,        ->{ order("RAND()") }

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
    per_day_price    = calc_per_day_price(self, params[:guests_sum])
    stay_days        = params[:days].to_i
    variable_price   = (per_day_price*stay_days)
    fixed_price      = calc_fixed_price(self)
    price            = generate_price_hash(variable_price,fixed_price,per_day_price)
    return price
  end

  def calc_per_day_price(home, guests_sum)
    add_num = guests_sum.to_i - home.price.additional_fee_from
    if add_num > 0
      per_day = home.price.default_price + (add_num * home.price.additional_fee_per_person)
    else
      per_day = home.price.default_price
    end
    return per_day
  end

  def calc_fixed_price(home)
    return home.price.cleaning_fee + home.price.service_fee
  end

  def generate_price_hash(variable,fixed,per_day)
    price = {}
    price[:total]    = variable + fixed
    price[:per_day]  = per_day
    price[:variable] = variable
    return price
  end
end
