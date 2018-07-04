class Home < ApplicationRecord
  require 'open-uri'
  require 'json'
  require 'webrick/httputils'

  enum status: { visitor: 0, host: 1 }
  has_many                  :additional_home_rules
  has_one                   :amenity
  has_one                   :bed_type
  has_one                   :available_spaces
  has_one                   :overview
  has_one                   :available_setting
  has_one                   :price
  has_one                   :home_rule
  has_one                   :additional_home_rule
  has_one                   :home_notification
  has_one                   :cancel_policy
  has_many                  :listing_photos
  belongs_to                :home_category_sub
  belongs_to                :room_type
  belongs_to                :user
  belongs_to                :country
  belongs_to                :room_type
  belongs_to                :currency
  belongs_to                :home_category_sub

  accepts_nested_attributes_for :additional_home_rules, :amenity, :bed_type, :available_spaces, :overview, :available_setting, :price, :home_rule, :additional_home_rule, :home_notification, allow_destroy: true, reject_if: :reject_additional_home_rules

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def reject_additional_home_rules(attributes)
    attributes['content'].blank?
  end

  def open_url(url)
    open(url).read
  end

  def recommend(name)
    begin
      modified_name     = name.gsub(" ", "%20")
      url               = URI.parse("https://obscure-river-88190.herokuapp.com/#{modified_name}")
      learning_result   = open_url(url)
    rescue
      "おすすめが出てきません。。。"
    end
  end

  default_scope { limit(5) }
  scope :sphost_home, -> { where user_id: User.superhost.ids }
  scope :by_prefecture, ->(string) { where(prefecture: string) }
  scope :space, -> {}

end
