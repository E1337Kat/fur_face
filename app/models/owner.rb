# frozen_string_literal: true

# Model for an owner. Not always cute. Always crazy
class Owner < ApplicationRecord
  enum locations: {
    chattanooga: 0,
    atlanta: 1,
    washington_dc: 3,
    meownemar: 4
  }

  has_many :cat_owners, dependent: :destroy
  has_many :cats, through: :cat_owners
end
