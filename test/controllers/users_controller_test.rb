require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { birth_day: @user.birth_day, building: @user.building, name: @user.name, phone_number: @user.phone_number, postal_code: @user.postal_code, prefeture: @user.prefeture, self_introduction: @user.self_introduction, sex: @user.sex, street: @user.street, town: @user.town } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { birth_day: @user.birth_day, building: @user.building, name: @user.name, phone_number: @user.phone_number, postal_code: @user.postal_code, prefeture: @user.prefeture, self_introduction: @user.self_introduction, sex: @user.sex, street: @user.street, town: @user.town } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
