require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get intro" do
    get :intro
    assert_response :success
  end

  test "should get default" do
    get :default
    assert_response :success
  end

end
