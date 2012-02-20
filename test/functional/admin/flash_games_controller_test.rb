require 'test_helper'

class Admin::FlashGamesControllerTest < ActionController::TestCase
  setup do
    @admin_flash_game = admin_flash_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_flash_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_flash_game" do
    assert_difference('Admin::FlashGame.count') do
      post :create, :admin_flash_game => @admin_flash_game.attributes
    end

    assert_redirected_to admin_flash_game_path(assigns(:admin_flash_game))
  end

  test "should show admin_flash_game" do
    get :show, :id => @admin_flash_game.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_flash_game.to_param
    assert_response :success
  end

  test "should update admin_flash_game" do
    put :update, :id => @admin_flash_game.to_param, :admin_flash_game => @admin_flash_game.attributes
    assert_redirected_to admin_flash_game_path(assigns(:admin_flash_game))
  end

  test "should destroy admin_flash_game" do
    assert_difference('Admin::FlashGame.count', -1) do
      delete :destroy, :id => @admin_flash_game.to_param
    end

    assert_redirected_to admin_flash_games_path
  end
end
