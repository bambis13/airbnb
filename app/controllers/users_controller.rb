class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new
    @user = params[:first_name, :last_name, :birth_day, :phone_number, :encrypted_password, :email, :country_id, :language_id, :currency_id]
  end

  def edit
    @user = current_user
  end

  def update
  end

  def edit
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:sign_up, keys: [:first_name, :last_name, :sex, :birth_day, :phone_number, :postal_code, :self_introduction, :prefecture, :town, :street, :building, :status, :country_id, :language_id, :currency_id], :encrypted_password, :email)
  end
end
