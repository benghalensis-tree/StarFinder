require "test_helper"

class MyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_pages_show_url
    assert_response :success
  end

  test "should get edit" do
    get my_pages_edit_url
    assert_response :success
  end
end
