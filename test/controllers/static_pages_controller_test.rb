require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = 'Float Plan'
  end
  
  test "should get home" do
    get home_url
    assert_select 'h1', 'Welcome!'
    assert_select 'title', "#{@base_title}"
  end
  
  test "should get float plans" do
    get float_plans_url
    assert_response :success
    assert_select 'title', "Float Plans | #{@base_title}"
  end
  
  test "should get new float plan" do
    get float_plans_new_url
    assert_response :success
    assert_select 'title', "New Float Plan | #{@base_title}"
  end
  
  test "should get fleet page" do
    get fleet_url
    assert_response :success
    assert_select 'title', "Fleet | #{@base_title}"
  end
  
  test "debug dump shoud not appear on pages" do
    get home_url
    assert_select 'div[class=?]', 'debug_dump', false
  end

end