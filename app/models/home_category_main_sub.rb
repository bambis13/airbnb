class HomeCategoryMainSub < ApplicationRecord
  belongs_to :home_category_main,    dependent: :destroy
  belongs_to :home_category_sub,     dependent: :destroy
end
