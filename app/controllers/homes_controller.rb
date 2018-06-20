class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :get_homes, only: [:index, :homes, :search, :area_specific]

  def index
    @homes = @homes[0..4]
    @homes_newyork = @homes_newyork[0..4]
    @homes_barcelona = @homes_barcelona[0..4]
    @homes_paris = @homes_paris[0..4]
    @homes_super = @homes_super[0..4]
  end

  def area_specific
    @homes = @homes.by_prefecture(params[:prefecture])
    @homes_super = @homes.sphost_home
    @area_name = params[:prefecture]
  end

  def family
    @homes_family = Home.all
  end

  def business
    @homes_business = Home.all
  end

  def homes
    @homes = @homes[0..9]
    if params[:capacity]
      @homes = Home.joins(:home_rule).where(home_rules: {accept_kids: params[:children], accept_babies: params[:babies]}).where("capacity > ?", params[:capacity])
    end
  end

  def search
    @homes = Home.where("prefecture LIKE(?)", "%#{params[:keyword]}%").group(:prefecture)
    @homes.where
    respond_to do |format|
      format.html {redirect_to homes_path(@homes)}
      format.json
    end
  end

  def show
    @beds      = BedType.where(home_id: params[:id])
    @rules     = @home.home_rule
    @amenities = @home.amenity
    @host      = @home.user
    @photos    = @home.listing_photos
    @cancel    = @home.cancel_policy
    @space     = AvailableSpace.find_by(home_id: params[:id])
  end

  def new
    @home = Home.new
  end

  def edit
  end

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

  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_home
    @home = Home.find(params[:id])
  end

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
