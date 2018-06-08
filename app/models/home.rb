class Home < ApplicationRecord
   enum status: { visitor: 0, host: 1 }
  has_many                :additional_home_rules
  belongs_to              :home_category_sub
  belongs_to              :room_type
  has_one                 :amenity
  has_one                 :bed_type
  has_one                 :available_spaces
  has_one                 :overview
  has_one                 :available_setting
  has_one                 :price
  has_one                 :home_rule
  has_one                 :additional_home_rule
  has_one                 :home_notification

  accepts_nested_attributes_for :additional_home_rules, :amenity, :bed_type, :available_spaces, :overview, :available_setting, :price, :home_rule, :additional_home_rule, :home_notification, allow_destroy: true, reject_if: :reject_additional_home_rules


  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

end
