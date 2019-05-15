require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @base_title = 'Float Plan'
  end
    
  test "should get float plans" do
    log_in_as(@user)
    get plans_url
    assert_response :success
    assert_select 'title', "Float Plans | #{@base_title}"
  end
  
  test "should get new float plan" do
    log_in_as(@user)
    get new_plan_url
    assert_response :success
    assert_select 'title', "New Float Plan | #{@base_title}"
  end
  
  test 'no float plans for non-logged in users' do
    get plans_url
    assert_redirected_to login_url
    assert_not flash.empty?
    get new_plan_url
    assert_redirected_to login_url
    assert_not flash.empty?
  end
end
