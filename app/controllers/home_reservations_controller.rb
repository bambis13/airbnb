class HomeReservationsController < ApplicationController
  before_action :set_home_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_home, only: [:calc_total_fee, :get_checkout, :show]

  def index
    @home_reservations = HomeReservation.all
  end

  def create
    @home_reservation = HomeReservation.new(home_reservation_params)
    respond_to do |format|
      if @home_reservation.save
        format.html { redirect_to root_path, notice: 'Home reservation was successfully created.' }
      else
        format.html { redirect_to root_path, notice: '予約に失敗しました' }
      end
    end
  end

  def show
    @disable_dates = view_context.get_disable_dates(@home, @home_reservations)
    respond_to do |format|
      format.json
    end
  end
  # def update
  #   respond_to do |format|
  #     if @home_reservation.update(home_reservation_params)
  #       format.html { redirect_to @home_reservation, notice: 'Home reservation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @home_reservation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @home_reservation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @home_reservation.destroy
  #   respond_to do |format|
  #     format.html { redirect_to home_reservations_url, notice: 'Home reservation was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  def get_checkout
    checkout = view_context.get_checkout(@home, params[:checkin], params[:reserved])
    respond_to do |format|
      format.json{ render json: {min: checkout[:min], max: checkout[:max] }}
    end
  end

  def calc_total_fee
    price = view_context.calc_prices(@home)
    respond_to do |format|
      format.json{ render json: {total: price[:total], per_day: price[:per_day], variable: price[:variable]}}
    end
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def set_home_reservation
      @home_reservations = HomeReservation.where(home_id: params[:id])
    end

    def set_user_reservation
      @user_reservation = HomeReservation.where(user_id: params[:id])
    end

    def home_reservation_params
      params.require(:home_reservation).permit(:checkin_date, :checkout_date, :number_of_adults,:number_of_children,:number_of_babies,:service_fee,:cleaning_fee,:per_day_fee,:total_fee,:user_id, :home_id)
    end
end
