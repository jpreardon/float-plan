require 'test_helper'

class BoatsIndexTest < ActionDispatch::IntegrationTest
 
  def setup
    @admin = users(:david)
    @user = users(:quint)
    @boat = boats(:wasp)
  end
  
  test 'index includes all boats' do
    log_in_as(@admin)
    get boats_path
    assert_template 'boats/index'
    Boat.all.each do |boat|
      assert_select 'a[href=?]', edit_boat_path(boat)
    end
  end
  
  test 'index has no links for non-admins' do
    log_in_as(@user)
    get boats_path
    assert_template 'boats/index'
    assert_select 'a[href=?]', boat_path(@boat), count: 0
  end
  
  test 'page includes a new boat button for admins' do
    log_in_as(@admin)
    get boats_path
    assert_select 'a[href=?]', new_boat_path
  end
  
  test 'no new boat button for non-admins' do
    log_in_as(@user)
    get boats_path
    assert_select 'a[href=?]', new_boat_path, count: 0
  end
end
