require 'test_helper'

class PlansEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:david)
    @user = users(:quint)
    @david_plan = plans(:davids)
    @quint_plan = plans(:quints)
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
  
  test 'edit button should not display after final submission' do
    skip 'Fill this in once the float plan form is closer being finished'
  end
end
