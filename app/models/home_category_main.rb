class HomeCategoryMain < ApplicationRecord
  has_many :home_category_sub, through: :home_category_main_sub
  has_many :home
end
