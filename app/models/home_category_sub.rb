class HomeCategorySub < ApplicationRecord
  has_many :home_category_main, through: :home_category_main_sub
  has_many :homes
end
