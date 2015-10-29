require 'test_helper'

class InformationControllerTest < ActionController::TestCase
  test "should get what" do
    get :what
    assert_response :success
  end

  test "should get programme" do
    get :programme
    assert_response :success
  end

  test "should get data" do
    get :data
    assert_response :success
  end

  test "should get policy" do
    get :policy
    assert_response :success
  end
end
