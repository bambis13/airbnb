class HomeReservationsController < ApplicationController
  before_action :set_home_reservation, only: [:show, :edit, :update, :destroy]

  # GET /home_reservations
  # GET /home_reservations.json
  def index
    @home_reservations = HomeReservation.all
  end

  # GET /home_reservations/1
  # GET /home_reservations/1.json
  def show
  end

  # GET /home_reservations/new
  def new
    @home_reservation = HomeReservation.new
  end

  # GET /home_reservations/1/edit
  def edit
  end

  # POST /home_reservations
  # POST /home_reservations.json
  def create
    @home_reservation = HomeReservation.new(home_reservation_params)
    @home_reservation

    respond_to do |format|
      if @home_reservation.save
        format.html { redirect_to @home_reservation, notice: 'Home reservation was successfully created.' }
        format.json { render :show, status: :created, location: @home_reservation }
      else
        format.html { render :new }
        format.json { render json: @home_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_reservations/1
  # PATCH/PUT /home_reservations/1.json
  def update
    respond_to do |format|
      if @home_reservation.update(home_reservation_params)
        format.html { redirect_to @home_reservation, notice: 'Home reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_reservation }
      else
        format.html { render :edit }
        format.json { render json: @home_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_reservations/1
  # DELETE /home_reservations/1.json
  def destroy
    @home_reservation.destroy
    respond_to do |format|
      format.html { redirect_to home_reservations_url, notice: 'Home reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_reservation
      @home_reservation = HomeReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_reservation_params
      params.require(:home_reservation).permit(:checkin_date, :checkout_date, :number_of_guests, :accomodation_fee, :cleaning_fee, :service_fee,:total_price)
    end
end
