class Price < ApplicationRecord
  belongs_to :home
  enum   pricing_method:  { fixed: 0, variable: 1 }
end
