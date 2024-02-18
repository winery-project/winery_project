require "test_helper"

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_companies_show_url
    assert_response :success
  end
end
