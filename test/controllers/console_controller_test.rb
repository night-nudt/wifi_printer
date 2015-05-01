require 'test_helper'

class ConsoleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get print" do
    get :print
    assert_response :success
  end

end
