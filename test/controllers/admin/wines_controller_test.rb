require "test_helper"

class Admin::WinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_wines_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_wines_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_wines_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_wines_edit_url
    assert_response :success
  end
end
