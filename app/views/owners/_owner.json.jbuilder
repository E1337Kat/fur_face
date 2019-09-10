# frozen_string_literal: true

json.extract! owner, :id, :name, :actually_a_catgirl, :location, :created_at, :updated_at
json.url owner_url(owner, format: :json)
