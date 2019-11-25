require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Eventbrite App"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get home" do
    get main_page_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get about" do
    get main_page_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
