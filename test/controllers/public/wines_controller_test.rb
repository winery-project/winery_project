require "test_helper"

class Public::WinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_wines_index_url
    assert_response :success
  end

  test "should get show" do
    get public_wines_show_url
    assert_response :success
  end
end
