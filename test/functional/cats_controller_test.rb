require 'test_helper'

class CatsControllerTest < ActionController::TestCase
  setup do
    @cat = cats(:one)
    @update = {
      name: 'OPAPI'
    }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cats)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create cat" do
    assert_difference('Cat.count') do
      post :create, cat: @update
    end
    
    assert_redirected_to cats_path
  end
  
  test "should update cat" do
    put :update, id: @cat.to_param, cat: @update
    assert_redirected_to cat_path(assigns(:cat))
  end
  
  test "should lottery cat" do
    #.....orz
  end
end
