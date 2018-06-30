class Home < ApplicationRecord

  enum status: { visitor: 0, host: 1 }
  has_many                  :additional_home_rules
  has_many                  :listing_photos
  has_one                   :amenity
  has_one                   :bed_type
  has_one                   :available_space
  has_one                   :overview
  has_one                   :availability_setting
  has_one                   :price
  has_one                   :home_rule
  has_one                   :additional_home_rule
  has_one                   :home_notification
  has_one                   :cancel_policy
  belongs_to                :home_category_sub
  belongs_to                :room_type
  belongs_to                :user
  belongs_to                :country
  belongs_to                :currency
  belongs_to                :home_category_main

  accepts_nested_attributes_for :additional_home_rules, allow_destroy: true, reject_if: :reject_additional_home_rules
  accepts_nested_attributes_for :amenity, allow_destroy: true
  accepts_nested_attributes_for :bed_type, allow_destroy: true
  accepts_nested_attributes_for :available_space, allow_destroy: true
  accepts_nested_attributes_for :overview, allow_destroy: true
  accepts_nested_attributes_for :availability_setting, allow_destroy: true
  accepts_nested_attributes_for :price, allow_destroy: true
  accepts_nested_attributes_for :home_rule, allow_destroy: true
  accepts_nested_attributes_for :home_notification, allow_destroy: true
  accepts_nested_attributes_for :listing_photos, allow_destroy: true
  accepts_nested_attributes_for :cancel_policy, allow_destroy: true

  validates :capacity,              presence: true
  validates :number_of_bedroom,     presence: true
  validates :number_of_bathroom,    presence: true
  validates :number_of_beds,        presence: true
  validates :postalcode,            presence: true
  validates :prefecture,            presence: true
  validates :town,                  presence: true
  validates :street,                presence: true
  validates :building,              presence: true
  validates :location_x,            presence: true
  validates :location_y,            presence: true
  validates :name,                  presence: true
  validates :home_category_sub_id,  presence: true
  validates :home_category_main_id, presence: true
  validates :room_type_id,          presence: true
  validates :user_id,               presence: true
  validates :country_id,            presence: true
  validates :currency_id,           presence: true
  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def home_rules_children(params)
    HomeRule.where("accept_children> ?", paramas)
  end

  default_scope { limit(5) }
  scope :sphost_home, -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }

end
