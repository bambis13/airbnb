require 'test_helper'

class HomeReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_review = home_reviews(:one)
  end

  test "should get index" do
    get home_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_home_review_url
    assert_response :success
  end

  test "should create home_review" do
    assert_difference('HomeReview.count') do
      post home_reviews_url, params: { home_review: { accuracy_rate: @home_review.accuracy_rate, checkin_rate: @home_review.checkin_rate, cleanliness_rate: @home_review.cleanliness_rate, communication_rate: @home_review.communication_rate, cost_performance_rate: @home_review.cost_performance_rate, location_rate: @home_review.location_rate, review: @home_review.review } }
    end

    assert_redirected_to home_review_url(HomeReview.last)
  end

  test "should show home_review" do
    get home_review_url(@home_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_review_url(@home_review)
    assert_response :success
  end

  test "should update home_review" do
    patch home_review_url(@home_review), params: { home_review: { accuracy_rate: @home_review.accuracy_rate, checkin_rate: @home_review.checkin_rate, cleanliness_rate: @home_review.cleanliness_rate, communication_rate: @home_review.communication_rate, cost_performance_rate: @home_review.cost_performance_rate, location_rate: @home_review.location_rate, review: @home_review.review } }
    assert_redirected_to home_review_url(@home_review)
  end

  test "should destroy home_review" do
    assert_difference('HomeReview.count', -1) do
      delete home_review_url(@home_review)
    end

    assert_redirected_to home_reviews_url
  end
end
