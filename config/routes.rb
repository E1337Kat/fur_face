Rails.application.routes.draw do
  resources :owners
  resources :pet_owners, only: %i[create new]
  resources :cats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
