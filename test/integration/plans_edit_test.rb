require 'test_helper'

class PlansEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:quint)
    @plan = plans(:davids)
  end
  
  test 'edit button should not display on other skippers plans' do
    log_in_as(@user)
    get plan_path(@plan)
    assert_select 'a[href=?]', edit_plan_path(@plan), count: 0
  end
  
  test 'edit button should not display after final submission' do
    skip()
  end
  
  test 'edit button should appear for admin users, always' do
    skip()
  end
end
