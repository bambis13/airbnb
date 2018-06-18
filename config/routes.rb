Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :messages
  resources :home_reviews
  # resources :devise_users
  resources :homes
  get 'family', to: 'homes#family'
  get 'business', to: 'homes#business'
  get 'home/s', to: 'homes#homes'
  get 'search', to: 'homes#search'
  resources :home_reservations, only: [:new, :create, :edit, :update]
end
