# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: %i[index]
  resources :owners
  resources :cat_owners, only: %i[create new]
  resources :cats
end
