class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
    @homes_ny = @homes.by_prefecture("ニューヨーク")
    @homes_br = @homes.by_prefecture("バルセロナ")
    @homes_pr = @homes.by_prefecture("パリ")
    @homes_sp = @homes.sphost_home
  end

  def family
    @homes_fm = Home.all
  end

  def business
    @homes_bs = Home.all
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
end
