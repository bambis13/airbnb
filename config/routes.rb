Rails.application.routes.draw               do
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :devise_users
  resources           :home_reservations, only: [:new, :create, :edit, :update]
  resources           :homes, only: [:show, :new, :create] do
    collection                            do
      get             :homes
      get             :family
      get             :business
    end
  end
  root 'homes#index'
  get 'family', to: 'homes#family'
  get 'business', to: 'homes#business'
  get 'homes', to: 'homes#homes'
  get 'search', to: 'homes#search'
  get '/:prefecture', to: 'homes#area_specific'
end


