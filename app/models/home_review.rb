class HomeReview < ApplicationRecord
  belongs_to :home
  belongs_to :user
  belongs_to :home_reservation
end
