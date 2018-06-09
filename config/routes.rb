Rails.application.routes.draw do
  # devise_for :users
  root 'homes#index'
  # resources :messages
  # resources :home_reviews
  # # resources :devise_users
  resources :homes, only: [:show]
#   resources :home_reservations, only: [:new, :create, :edit, :update]
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
