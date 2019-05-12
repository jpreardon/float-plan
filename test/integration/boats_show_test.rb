require 'test_helper'

class BoatsShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:david)
    @user = users(:quint)
    @boat = boats(:wasp)
  end
  
  test 'admins should see edit/delete links' do
    log_in_as(@admin)
    get boat_path(@boat)
    assert_template 'boats/show'
    assert_select 'a[href=?]', edit_boat_path(@boat), count: 1
    assert_select 'a[href=?]', boat_path(@boat), count: 1
  end
  
  test 'non-admins should not see edit/delete links' do
    log_in_as(@user)
    get boat_path(@boat)
    assert_template 'boats/show'
    assert_select 'a[href=?]', edit_boat_path(@boat), count: 0
    assert_select 'a[href=?]', boat_path(@boat), count: 0
  end
end
