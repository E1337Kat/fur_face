# frozen_string_literal: true

# Model for a cat. It's cute.
class Cat < ApplicationRecord
  enum fluff_type: {
    short_hair: 0,
    medium_hair: 1,
    long_hair: 2,
    fat_long_hair: 3,
    naked: 4
  }, _prefix: :cat, _suffix: :status

  has_many :cat_owners, dependent: :destroy
  has_many :owners, through: :cat_owners
end
