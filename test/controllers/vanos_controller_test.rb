require 'test_helper'

class VanosControllerTest < ActionController::TestCase
  setup do
    @vano = vanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vano" do
    assert_difference('Vano.count') do
      post :create, vano: { conductor_id: @vano.conductor_id, hconductor: @vano.hconductor, nombre: @vano.nombre, proyecto_id: @vano.proyecto_id, vano: @vano.vano, zona_id: @vano.zona_id }
    end

    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should show vano" do
    get :show, id: @vano
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vano
    assert_response :success
  end

  test "should update vano" do
    patch :update, id: @vano, vano: { conductor_id: @vano.conductor_id, hconductor: @vano.hconductor, nombre: @vano.nombre, proyecto_id: @vano.proyecto_id, vano: @vano.vano, zona_id: @vano.zona_id }
    assert_redirected_to vano_path(assigns(:vano))
  end

  test "should destroy vano" do
    assert_difference('Vano.count', -1) do
      delete :destroy, id: @vano
    end

    assert_redirected_to vanos_path
  end
end
