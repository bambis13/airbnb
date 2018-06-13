Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :messages
  resources :home_reviews
  # resources :devise_users
  resources :home
  get 'family', to: 'homes#family'
  get 'business', to: 'homes#business'
  get 'homes', to: 'homes#homes'
  resources :home_reservations, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users' => 'users#show'
  get 'homes/new' => 'home#new'
end
