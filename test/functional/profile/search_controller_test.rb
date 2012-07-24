require 'test_helper'

class Profile::SearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
