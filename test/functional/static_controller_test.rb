require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

end
