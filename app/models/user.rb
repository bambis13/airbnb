class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorite_lists
  has_many :listing_photos
  has_many :messages
  has_many :home_reviews
  has_many :home_reservations
  belongs_to :language
  belongs_to :country
  belongs_to :currency
end
