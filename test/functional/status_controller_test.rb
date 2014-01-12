require 'test_helper'

class StatusControllerTest < ActionController::TestCase
  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
