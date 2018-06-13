Rails.application.routes.draw do
<<<<<<< HEAD

=======
>>>>>>> signup_func
  devise_for :users

  root 'homes#index'
  resources :devise_users
  resources :messages



<<<<<<< HEAD
  root 'homes#index'

  resources :home_reservations
  resources :home_reviews
  resources :homes

=======
  resources :home_reviews
  # resources :devise_users
  # resources :home do
  resources :home_reservations, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> signup_func
end
