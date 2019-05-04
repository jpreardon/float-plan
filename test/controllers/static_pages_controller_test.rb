require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = 'Float Plan'
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_select 'h1', 'Welcome!'
    assert_select 'title', "#{@base_title}"
  end
  
  test "should get float plans" do
    get static_pages_float_plans_url
    assert_response :success
    assert_select 'title', "Float Plans | #{@base_title}"
  end
  
  test "should get new float plan" do
    get static_pages_new_float_plan_url
    assert_response :success
    assert_select 'title', "New Float Plan | #{@base_title}"
  end
  
  test "should get fleet page" do
    get static_pages_fleet_url
    assert_response :success
    assert_select 'title', "Fleet | #{@base_title}"
  end
  
  test "should get crew page" do
    get static_pages_crew_url
    assert_response :success
    assert_select 'title', "Crew | #{@base_title}"
  end
  
  test "debug dump shoud not appear on pages" do
    get static_pages_home_url
    assert_select 'div[class=?]', 'debug_dump', false
  end

end
