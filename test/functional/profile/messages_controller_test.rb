require 'test_helper'

class Profile::MessagesControllerTest < ActionController::TestCase
  test "should get inbox" do
    get :inbox
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

  test "should get sent" do
    get :sent
    assert_response :success
  end

  test "should get compose" do
    get :compose
    assert_response :success
  end

end
