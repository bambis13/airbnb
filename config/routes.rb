Rails.application.routes.draw               do
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :home_reservations, only: [:new, :create, :edit, :update]
  resources           :homes, only: [:show] do
    collection                            do
      get             :homes
      get             :family
      get             :business
    end
  end
  root 'homes#index'
  get '/search',      to: 'homes#search'
  get '/:prefecture', to: 'homes#area_specific'
end


