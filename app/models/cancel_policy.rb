class CancelPolicy < ApplicationRecord
  belongs_to :home

  enum strict_level: {easy: 0, normal: 1, strict: 2, very_strict:3 }
end
