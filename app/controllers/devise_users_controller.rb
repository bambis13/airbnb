class DeviseUsersController < ApplicationController
  def index
  end

  def new
  end

  def create
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
    params.require(:user).permit(:sign_up, keys: [:name, :sex, :birth_day, :phone_number, :postal_code, :self_introduction, :prefecture, :town, :street, :building, :status, :country_id, :language_id, :currency_id])
  end
end
