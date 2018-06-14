require 'test_helper'

class HomeReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_reservation = home_reservations(:one)
  end

  test "should get index" do
    get home_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_home_reservation_url
    assert_response :success
  end

  test "should create home_reservation" do
    assert_difference('HomeReservation.count') do
      post home_reservations_url, params: { home_reservation: { checkin_date: @home_reservation.checkin_date, checkout_date: @home_reservation.checkout_date, number_of_guests: @home_reservation.number_of_guests } }
    end

    assert_redirected_to home_reservation_url(HomeReservation.last)
  end

  test "should show home_reservation" do
    get home_reservation_url(@home_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_reservation_url(@home_reservation)
    assert_response :success
  end

  test "should update home_reservation" do
    patch home_reservation_url(@home_reservation), params: { home_reservation: { checkin_date: @home_reservation.checkin_date, checkout_date: @home_reservation.checkout_date, number_of_guests: @home_reservation.number_of_guests } }
    assert_redirected_to home_reservation_url(@home_reservation)
  end

  test "should destroy home_reservation" do
    assert_difference('HomeReservation.count', -1) do
      delete home_reservation_url(@home_reservation)
    end

    assert_redirected_to home_reservations_url
  end
end
