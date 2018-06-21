Rails.application.routes.draw do
  root 'homes#index'
  get '/:prefecture', to: 'homes#area_specific'
  devise_for          :users
  resources           :messages
  resources           :home_reviews
  resources           :devise_users
  resources           :home_reservations, only: [:new, :create, :edit, :update]
  resources           :homes, only: [:show] do
    collection  do
      get :homes
      get :family
      get :business
      get :search
    end
  end
end


