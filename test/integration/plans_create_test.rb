require 'test_helper'

class PlansCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @other_user = users(:quint)
    @crew = users(:joeballast)
    @plan = plans(:davids)
  end
  
  test 'should be able to edit crew' do
    log_in_as(@user)
    get plan_path(@plan)
    assert_match @other_user.full_name, response.body
    @plan.crew << @crew
    patch plan_path(@plan), params: { plan: { crew: @plan.crew } }
    assert_redirected_to plan_path(@plan)
    follow_redirect!
    assert_match @other_user.full_name, response.body
    assert_match @crew.full_name, response.body
    @plan.crew.second.destroy!
    patch plan_path(@plan), params: { plan: { crew: @plan.crew } }
    assert_redirected_to plan_path(@plan)
    follow_redirect!
    assert_match @crew.full_name, response.body
    assert_no_match @other_user.full_name, response.body
  end
 
  test 'should be able to submit first part of plan' do
    skip
  end
  
  test 'should be able to edit previously entered information' do
    skip
  end
  
  test 'should get second part of plan after initial submission' do
    skip
  end
  
  test 'should be able to complete plan' do
    skip
  end
end
