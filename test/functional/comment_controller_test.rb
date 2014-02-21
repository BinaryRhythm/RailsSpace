require 'test_helper'

class CommentControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end