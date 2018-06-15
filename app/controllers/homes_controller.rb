class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :get_homes, only: [:index, :homes, :search]
  # GET /homes
  # GET /homes.json
  def index
    @homes = @homes[0..4]
    @homes_newyork = @homes_newyork[0..4]
    @homes_barcelona = @homes_barcelona[0..4]
    @homes_paris = @homes_paris[0..4]
    @homes_super = @homes_super[0..4]
  end

  def family
    @homes_family = Home.all
  end

  def business
    @homes_business = Home.all
  end

  def homes
    @homes = @homes[0..9]
  end

  def search

  end

  # GET /homes/1
  # GET /homes/1.json
  def show
    @beds      = BedType.where(home_id: params[:id])
    @rules     = @home.home_rule
    @amenities = @home.amenity
    @host      = @home.user
    @photos    = @home.listing_photos
    @cancel    = @home.cancel_policy
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end




  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_home
    @home = Home.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def home_params
    params.fetch(:home, {})
  end

  def get_homes
    @homes = Home.all
    @homes_newyork = @homes.by_prefecture("ニューヨーク")
    @homes_barcelona = @homes.by_prefecture("バルセロナ")
    @homes_paris = @homes.by_prefecture("パリ")
    @homes_super = @homes.sphost_home
  end
end
