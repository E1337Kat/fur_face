# frozen_string_literal: true

json.extract! cat_owner, :id, :name, :cats, :actually_a_catgirl, :created_at, :updated_at
json.url cat_owner_url(cat_owner, format: :json)
