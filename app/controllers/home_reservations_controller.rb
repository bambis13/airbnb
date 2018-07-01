class HomeReservationsController < ApplicationController
  before_action :set_home_reservation, only: [:show, :edit, :update, :destroy,:calc_checkout]
  before_action :set_home, only: [:calc_total_fee, :calc_checkout, :show]

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
    reservation_dates = @home_reservations.only_dates.after_checkout_day(Date.today)
    disable_dates     = view_context.make_disable_dates(reservation_dates, @home.availability_setting.minimum_accomodation_range)
    min_date          = view_context.make_min_checkin(@home.availability_setting.reservation_deadline)
    max_date          = view_context.make_max_checkin(@home.availability_setting.acceptable_month_ahead)
    respond_to do |format|
      format.json{render json:{min: min_date, max: max_date, disables: disable_dates}}
    end
  end

  def calc_checkout
    min_checkout         = view_context.calc_default_checkout(@home.availability_setting.minimum_accomodation_range, params[:checkin])
    default_max_checkout = view_context.calc_default_checkout(@home.availability_setting.muximum_accomodation_range, params[:checkin])
    earliest_reservation = @home_reservations.only_dates.before_checkin(min_checkout, default_max_checkout).first_checkin
    max_checkout         = earliest_reservation.present? ? view_context.convert_date_str(earliest_reservation[0].checkin_date) : default_max_checkout
    respond_to do |format|
      format.json{ render json: {min: min_checkout, max: max_checkout }}
    end
  end

  # def calc_total_fee
  #   price = view_context.calc_prices(@home)
  #   respond_to do |format|
  #     format.json{ render json: {total: price[:total], per_day: price[:per_day], variable: price[:variable]}}
  #   end
  # end

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
