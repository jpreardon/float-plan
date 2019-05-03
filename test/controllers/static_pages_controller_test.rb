require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_select 'h1', 'Welcome!'
    assert_select 'title', "Float Plan"
  end
  
  test "should get float plans" do
    get static_pages_float_plans_url
    assert_response :success
    assert_select 'title', "Float Plans | Float Plan"
  end
  
  test "should get new float plan" do
    get static_pages_new_float_plan_url
    assert_response :success
    assert_select 'title', "New Float Plan | Float Plan"
  end
  
  test "should get fleet page" do
    get static_pages_fleet_url
    assert_response :success
    assert_select 'title', "Fleet | Float Plan"
  end
  
  test "should get crew page" do
    get static_pages_crew_url
    assert_response :success
    assert_select 'title', "Crew | Float Plan"
  end

end
