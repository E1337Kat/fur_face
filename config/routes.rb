Rails.application.routes.draw do
  root 'welcome#index'
  resources :owners
  resources :cat_owners, only: %i[create new]
  resources :cats
end
