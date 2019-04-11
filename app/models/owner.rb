class Owner < ApplicationRecord
  enum locations: {
    chattanooga: 0,
    atlanta: 1,
    washington_dc: 3,
    meownemar: 4
  }

  has_many :cat_owners
  has_many :cats, through: :cat_owners
end
