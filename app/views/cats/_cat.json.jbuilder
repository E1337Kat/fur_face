# frozen_string_literal: true

json.extract! cat, :id, :name, :fluff_ears, :meow, :personality, :claws, :fluff_type, :created_at, :updated_at
json.url cat_url(cat, format: :json)
