class HomeReviewsController < ApplicationController
  before_action :set_home_review, only: [:show, :edit, :update, :destroy]

  def index
    @home_reviews = HomeReview.all
  end

  def show
  end

  def new
    @home_review = HomeReview.new
  end

  def edit
  end

  def create
    @home_review = HomeReview.new(home_review_params)

    respond_to do |format|
      if @home_review.save
        format.html { redirect_to @home_review, notice: 'Home review was successfully created.' }
        format.json { render :show, status: :created, location: @home_review }
      else
        format.html { render :new }
        format.json { render json: @home_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @home_review.update(home_review_params)
        format.html { redirect_to @home_review, notice: 'Home review was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_review }
      else
        format.html { render :edit }
        format.json { render json: @home_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @home_review.destroy
    respond_to do |format|
      format.html { redirect_to home_reviews_url, notice: 'Home review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_home_review
    @home_review = HomeReview.find(params[:id])
  end

  def home_review_params
    params.require(:home_review).permit(:review, :accuracy_rate, :location_rate, :communication_rate, :cleanliness_rate, :checkin_rate, :cost_performance_rate)
  end
end
