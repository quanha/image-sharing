require 'test_helper'

class BackendMenusControllerTest < ActionController::TestCase
  setup do
    @backend_menu = backend_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_menu" do
    assert_difference('BackendMenu.count') do
      post :create, backend_menu: { action: @backend_menu.action, controller: @backend_menu.controller, display_order: @backend_menu.display_order, hightlight: @backend_menu.hightlight, icon: @backend_menu.icon, name: @backend_menu.name, parent_id: @backend_menu.parent_id, plugin: @backend_menu.plugin, role: @backend_menu.role }
    end

    assert_redirected_to backend_menu_path(assigns(:backend_menu))
  end

  test "should show backend_menu" do
    get :show, id: @backend_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_menu
    assert_response :success
  end

  test "should update backend_menu" do
    patch :update, id: @backend_menu, backend_menu: { action: @backend_menu.action, controller: @backend_menu.controller, display_order: @backend_menu.display_order, hightlight: @backend_menu.hightlight, icon: @backend_menu.icon, name: @backend_menu.name, parent_id: @backend_menu.parent_id, plugin: @backend_menu.plugin, role: @backend_menu.role }
    assert_redirected_to backend_menu_path(assigns(:backend_menu))
  end

  test "should destroy backend_menu" do
    assert_difference('BackendMenu.count', -1) do
      delete :destroy, id: @backend_menu
    end

    assert_redirected_to backend_menus_path
  end
end
