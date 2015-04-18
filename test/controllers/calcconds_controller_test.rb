require 'test_helper'

class CalccondsControllerTest < ActionController::TestCase
  setup do
    @calccond = calcconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calcconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calccond" do
    assert_difference('Calccond.count') do
      post :create, calccond: { condclima_id: @calccond.condclima_id, flecha_h: @calccond.flecha_h, flecha_t: @calccond.flecha_t, flecha_v: @calccond.flecha_v, hielo: @calccond.hielo, temp: @calccond.temp, tension: @calccond.tension, tiro: @calccond.tiro, vano_id: @calccond.vano_id, viento: @calccond.viento }
    end

    assert_redirected_to calccond_path(assigns(:calccond))
  end

  test "should show calccond" do
    get :show, id: @calccond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calccond
    assert_response :success
  end

  test "should update calccond" do
    patch :update, id: @calccond, calccond: { condclima_id: @calccond.condclima_id, flecha_h: @calccond.flecha_h, flecha_t: @calccond.flecha_t, flecha_v: @calccond.flecha_v, hielo: @calccond.hielo, temp: @calccond.temp, tension: @calccond.tension, tiro: @calccond.tiro, vano_id: @calccond.vano_id, viento: @calccond.viento }
    assert_redirected_to calccond_path(assigns(:calccond))
  end

  test "should destroy calccond" do
    assert_difference('Calccond.count', -1) do
      delete :destroy, id: @calccond
    end

    assert_redirected_to calcconds_path
  end
end
