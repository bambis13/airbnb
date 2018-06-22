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
<<<<<<< HEAD
  resources :messages
  resources :home_reviews
  # resources :devise_users
  resources :homes
  get 'family', to: 'homes#family'
  get 'business', to: 'homes#business'
  get 'home/s', to: 'homes#homes'
  get 'search', to: 'homes#search'
  resources :home_reservations, only: [:new, :create, :edit, :update]
=======
  get '/search',      to: 'homes#search'
  get '/:prefecture', to: 'homes#area_specific'
>>>>>>> be24c80b1da226a13e65be4a4f9d251a07cf2bd1
end


