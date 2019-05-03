require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_select 'h1', 'Welcome!'
  end
  
  test "should get float plans" do
    get static_pages_float_plans_url
    assert_response :success
  end
  
  test "should get new float plan" do
    get static_pages_new_float_plan_url
    assert_response :success
  end
  
  test "should get fleet page" do
    get static_pages_fleet_url
    assert_response :success
  end
  
  test "should get crew page" do
    get static_pages_crew_url
    assert_response :success
  end

end
