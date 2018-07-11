class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum        status:    { visitor: 0, host: 1 }
  enum        superhost: { normal: 0, super: 1 }

  has_many   :homes             , dependent: :destroy
  has_many   :favorite_lists    , dependent: :destroy
  has_many   :messages
  has_many   :home_reviews
  has_many   :home_reservations
  belongs_to :language
  belongs_to :country
  belongs_to :currency

  scope :superhost, -> { where superhost: 1 }
end
