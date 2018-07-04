class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birth_day, :phone_number, :postal_code, :self_introduction, :prefecture, :town, :street, :building, :status, :country_id, :language_id, :currency_id])
  end
end
