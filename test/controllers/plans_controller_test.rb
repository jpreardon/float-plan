require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @other_user = users(:quint)
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
  
  test 'should not allow delete if not the correct user' do
    log_in_as(@other_user)
    plan = plans(:davids)
    assert_no_difference 'Plan.count' do
      delete plan_path(plan)
    end
    assert_redirected_to root_path
  end
  
  test 'should allow delete if the correct user' do
    log_in_as(@user)
    plan = plans(:davids)
    assert_difference 'Plan.count', -1 do
      delete plan_path(plan)
    end
  end
  
  test 'should not allow edit if not the correct user' do
    log_in_as(@other_user)
    plan = plans(:davids)
    patch plan_path(plan), params: { plan: { notes_in: 'yeah' } }
    assert_redirected_to root_path
  end
  
  test 'should allow edit if the correct user' do
    log_in_as(@user)
    plan = plans(:davids)
    patch plan_path(plan), params: { plan: { notes_in: 'yeah' } }
    assert_redirected_to plan_path(plan)
  end
  
  test 'non-skippers should not be able to create float plans' do
    skip()
  end
end
