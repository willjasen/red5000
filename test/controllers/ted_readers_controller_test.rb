require 'test_helper'

class TedReadersControllerTest < ActionController::TestCase
  setup do
    @ted_reader = ted_readers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ted_readers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ted_reader" do
    assert_difference('TedReader.count') do
      post :create, ted_reader: { url: @ted_reader.url }
    end

    assert_redirected_to ted_reader_path(assigns(:ted_reader))
  end

  test "should show ted_reader" do
    get :show, id: @ted_reader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ted_reader
    assert_response :success
  end

  test "should update ted_reader" do
    patch :update, id: @ted_reader, ted_reader: { url: @ted_reader.url }
    assert_redirected_to ted_reader_path(assigns(:ted_reader))
  end

  test "should destroy ted_reader" do
    assert_difference('TedReader.count', -1) do
      delete :destroy, id: @ted_reader
    end

    assert_redirected_to ted_readers_path
  end
end
