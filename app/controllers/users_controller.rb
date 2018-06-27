class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    respond_to do |format|
      format.html{root_path}
      format.json
    # @user = user.create
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
    params.require(:user).permit(:sign_up, keys: [:first_name, :last_name, :sex, :birth_day, :phone_number, :postal_code, :self_introduction, :prefecture, :town, :street, :building, :status, :country_id, :language_id, :currency_id])
  end
end
