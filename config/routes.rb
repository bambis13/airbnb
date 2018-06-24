Rails.application.routes.draw               do
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :devise_users
  resources           :home_reservations, only: [:new, :create, :edit, :update]
  resources           :homes, only: [:show] do
    collection                            do
      get             :homes
      get             :family
      get             :business
    end
  end
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
  get '/calc',        to: 'home_reservations#calc_total_fee'
  get '/search',      to: 'homes#search'
  get '/:prefecture', to: 'homes#area_specific'
end
