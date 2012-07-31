require 'test_helper'

class Admin::FeatureControllerTest < ActionController::TestCase
  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get videos" do
    get :videos
    assert_response :success
  end

  test "should get albums" do
    get :albums
    assert_response :success
  end

end
