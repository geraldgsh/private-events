require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_page_home_url
    assert_response :success
  end

  test "should get about" do
    get main_page_about_url
    assert_response :success
  end

end
