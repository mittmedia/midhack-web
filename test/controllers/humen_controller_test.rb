require 'test_helper'

class HumenControllerTest < ActionController::TestCase
  setup do
    @human = humen(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:humen)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create human" do
    assert_difference('Human.count') do
      post :create, human: { email: @human.email, knowledge: @human.knowledge, name: @human.name, news: @human.news, occupation: @human.occupation, phoneos: @human.phoneos, social: @human.social }
    end

    assert_redirected_to human_path(assigns(:human))
  end

  test "should show human" do
    get :show, id: @human
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @human
    assert_response :success
  end

  test "should update human" do
    patch :update, id: @human, human: { email: @human.email, knowledge: @human.knowledge, name: @human.name, news: @human.news, occupation: @human.occupation, phoneos: @human.phoneos, social: @human.social }
    assert_redirected_to human_path(assigns(:human))
  end

  test "should destroy human" do
    assert_difference('Human.count', -1) do
      delete :destroy, id: @human
    end

    assert_redirected_to humen_path
  end
end
