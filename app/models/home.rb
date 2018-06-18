class Home < ApplicationRecord
  has_many                :additional_home_rules
  belongs_to              :home_category_sub
  belongs_to              :room_type
  belongs_to              :user
  has_one                 :amenity
  has_one                 :bed_type
  has_one                 :available_spaces
  has_one                 :overview
  has_one                 :availability_setting
  has_one                 :price
  has_one                 :home_rule
  has_one                 :home_notification
  has_many                :listing_photos

  accepts_nested_attributes_for :additional_home_rules, :amenity, :bed_type, :available_spaces, :overview, :availability_setting, :price, :home_rule, :home_notification, allow_destroy: true, reject_if: :reject_additional_home_rules

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  scope :sphost_home, -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }
end
