Rails.application.routes.draw               do
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :devise_users
  resources           :home_reservations, only: [:create, :show]
  resources           :homes, only: [:show] do
    collection                            do
      get             :homes
      get             :family
      get             :business
    end
  end
  root 'homes#index'
  get '/calc',            to: 'home_reservations#calc_total_fee'
  get '/get_checkout/:id',to: 'home_reservations#get_checkout'
  get '/search',          to: 'homes#search'
  get '/:prefecture',     to: 'homes#area_specific'
end
