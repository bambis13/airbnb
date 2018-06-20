Rails.application.routes.draw do
  root 'homes#index'
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :devise_users
  resources           :homes, only: [:show]
  get 'family',       to: 'homes#family'
  get 'business',     to: 'homes#business'
  get 'homes',        to: 'homes#homes'
  get 'search',       to: 'homes#search'
  get '/:prefecture', to: 'homes#area_specific'
  resources           :home_reservations, only: [:new, :create, :edit, :update]
end
