require 'test_helper'

class PlansEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:david)
    @user = users(:quint)
    @skipper = users(:sallyskipper)
    @david_plan = plans(:davids)
    @quint_plan = plans(:quints)
    @sally_plan = plans(:sallycomplete)
    @sally_partial_plan = plans(:sallypartial)
  end
  
  test 'edit button should not display on other skippers plans' do
    log_in_as(@user)
    get plan_path(@david_plan)
    assert_select 'a[href=?]', edit_plan_path(@david_plan), count: 0
  end
  
  test 'edit button should appear for admin users, always' do
    log_in_as(@admin)
    get plan_path(@quint_plan)
    assert_select 'a[href=?]', edit_plan_path(@quint_plan)
  end
  
  test 'delted button should not display after final submission' do
    log_in_as(@skipper)
    get plan_path(@sally_plan)
    assert_select 'a[href=?]', plan_path(@sally_plan), count: 0
  end
  
  test 'should be able to edit previously entered information' do
    log_in_as(@skipper)
    get edit_plan_path(@sally_partial_plan)
    assert_select 'a[href=?]', edit_plan_path(@sally_partial_plan) + '?checkout_edit=true'
    patch plan_path(@sally_partial_plan), params: { plan: { time_out: '18:00' } }
    follow_redirect!
    assert_match '6:00 PM', response.body
  end
end
