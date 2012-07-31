require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get register_user" do
    get :register_user
    assert_response :success
  end

  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get forgot_password" do
    get :forgot_password
    assert_response :success
  end

end
