class HomeCategoryMainSub < ApplicationRecord
  belongs_to :category_main
  belongs_to :category_sub
end
