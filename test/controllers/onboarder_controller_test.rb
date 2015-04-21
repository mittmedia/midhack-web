require 'test_helper'

class OnboarderControllerTest < ActionController::TestCase
  test "should get tour" do
    get :tour
    assert_response :success
  end

  test "should get why" do
    get :why
    assert_response :success
  end

end
