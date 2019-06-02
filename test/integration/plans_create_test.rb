require 'test_helper'

class PlansCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @other_user = users(:quint)
    @skipper = users(:sallyskipper)
    @crew = users(:joeballast)
    @plan = plans(:davids)
    @partial_plan = plans(:sallypartial)
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
    log_in_as(@skipper)
    post plans_path, params: { plan: { skipper_id: @skipper.id, boat_id: boats(:wasp).id } }
    follow_redirect!
    assert_match 'Float plan added', response.body
  end
  
  test 'should get second part of plan after initial submission' do
    log_in_as(@skipper)
    get edit_plan_path(@partial_plan)
    assert_match 'Checkin Notes', response.body
  end
  
  test 'should be able to complete plan' do
    log_in_as(@skipper)
    patch plan_path(@partial_plan), params: { plan: { time_in: '20:00', checkin_complete: true } }
    follow_redirect!
    assert_match 'Plan completed', response.body
  end
end
