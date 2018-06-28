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
    respond_to do |format|
      format.html {redirect_to homes_path(@homes)}
      format.json
    end
  end

  def show
    @beds             = BedType.where(home_id: params[:id])
    @rules            = @home.home_rule
    @amenities        = @home.amenity
    @host             = @home.user
    @listing_photos   = @home.listing_photos
    @cancel    = @home.cancel_policy
    @space     = AvailableSpace.find_by(home_id: params[:id])
  end

  def new
    @home = Home.new
    @home.additional_home_rules.build
    @home.build_amenity
    @home.build_bed_type
    @home.build_available_space
    @home.build_availability_setting
    @home.build_overview
    @home.build_price
    @home.build_home_rule
    @home.build_home_notification
    @home.listing_photos.build
    @home.build_cancel_policy

    @countries = Country.all
    @main_categories = HomeCategoryMain.all
    @sub_categories = HomeCategorySub.all
    @room_types = RoomType.all
    @currency = Currency.all
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
    params.require(:home).permit(
      :country_id,
      :currency_id,
      :user_id,
      :room_type_id,
      :home_category_sub_id,
      :capacity,
      :number_of_bedroom,
      :number_of_bathroom,
      :number_of_beds,
      :postalcode,
      :prefecture,
      :town,
      :street,
      :building,
      :location_x,
      :location_y,
      :name,
      additional_home_rules_attributes: [:content],
      amenity_attributes: [
        :necessities,
        :wifi,
        :shampoo,
        :closet,
        :tv_set,
        :heating,
        :air_conditioner,
        :breakfast,
        :desk,
        :fireplace,
        :iron,
        :hair_dryer,
        :allowed_pet,
        :smoke_detector,
        :carbon_monoxide_detecter,
        :aid_set, :fire_extinguisher,
        :disaster_card,
        :keyed_door],
      bed_type_attributes: [
        :single_bed,
        :double_bed,
        :queen_bed,
        :sofa_bed],
      available_space_attributes: [
        :dedicated_living,
        :pool,
        :kitchen,
        :washer_machine,
        :washer_dryer_machine,
        :parking,
        :elevator,
        :gacuzzi,
        :gym],
      overview_attributes: [
        :overview,
        :pool,
        :about_listing,
        :areas_available,
        :communication_frequency,
        :other_notices,
        :area_information,
        :transportation],
      availability_setting_attributes: [
        :reservation_deadline,
        :checkin_time_deadline_from,
        :checkin_time_deadline_to,
        :acceptable_month_ahead,
        :muximum_accomodation_range,
        :minimum_accomodation_range],
      price_attributes: [
        :pricing_method,
        :default_price,
        :muximum_price,
        :minimum_price,
        :first_arrival_discount,
        :weekly_discount_rate,
        :monthly_discount_rate,
        :cleaning_fee, :deposit,
        :additional_fee_per_person],
      home_rule_attributes: [
        :accept_kids,
        :kids_reason,
        :accept_babies,
        :babies_reason,
        :accept_pet,
        :accept_smoking,
        :accept_event_party],
      home_notification_attributes: [
        :only_stairs,
        :stairs_detail,
        :noisy,
        :noisy_detail,
        :pet_stayed,
        :pet_detail,
        :no_parking,
        :parking_guide,
        :shared_space,
        :shared_space_detail,
        :limited_amenity,
        :limited_amenity_detail,
        :surveillance_camera,
        :camera_detail,
        :firearm,
        :firearm_detail,
        :dangerous_animal,
        :animal_detail],
      listing_photos_attributes: [
        :image,
        :user_id],
      cancel_policy_attributes: [
        :strict_level,
        :text]
    )
  end

  def get_homes
    @homes = Home.all
    @homes_newyork = @homes.by_prefecture("ニューヨーク")
    @homes_barcelona = @homes.by_prefecture("バルセロナ")
    @homes_paris = @homes.by_prefecture("パリ")
    @homes_super = @homes.sphost_home
  end
end
