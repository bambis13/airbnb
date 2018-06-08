class Home < ApplicationRecord
   enum status: { visitor: 0, host: 1 }

  has_many                :favorites, :home_reservations, :home_reviews, :additional_home_rules
  belongs_to              :home_category_sub, :room_type, :country, :currency, :user
  has_one                 :amenity, :bed_type, :available_spaces, :overview, :available_setting, :price, :home_rule, :additional_home_rule, :home_notification
  has_and_belongs_to_many :listing_photos

  accepts_nested_attributes_for :favorites, :home_reservations, :home_reviews, :additional_home_rules, :amenity, :bed_type, :available_spaces, :overview, :available_setting, :price, :home_rule, :additional_home_rule, :home_notification, allow_destroy: true, reject_if: :reject_additional_home_rules

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end
end
