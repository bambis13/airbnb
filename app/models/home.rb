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
  belongs_to                :room_type
  belongs_to                :currency
  belongs_to                :home_category_sub
  # geocoded_by               :town
  # after_validation          :geocode

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

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  # geocoded_by :address, latitude: :location_x, longitude: :location_y
  # before_validation :concat_address
  # def concat_address
  # address=[prefecture,town,street].join('')
  # end

  default_scope { limit(5) }
  scope :sphost_home, -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }

end
