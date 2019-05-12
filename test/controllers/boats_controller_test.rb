require 'test_helper'

class BoatsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = 'Float Plan'
    @user = users(:quint)
    @admin = users(:david)
    @boat = boats(:wasp)
  end
 
  test "logged in users should have access to boat index and show" do
    log_in_as(@user)
    get boats_path
    assert_response :success
    assert_select 'title', "Fleet | #{@base_title}"
    get boat_path(@boat)
    assert_response :success
  end
  
  test "admins can access new/edit boats" do
    log_in_as(@admin)
    get edit_boat_path(@boat)
    assert_response :success
    get new_boat_path
    assert_response :success
  end
  
  test 'admins can destroy boats' do
    log_in_as(@admin)
    assert_difference 'Boat.count', -1 do
      delete boat_path(@boat)
    end
    assert_not flash.empty?
    assert_redirected_to boats_path
  end
  
  test "non-admins can not access new/edit boats" do
    log_in_as(@user)
    get edit_boat_path(@boat)
    assert_not flash.empty?
    assert_redirected_to root_url
    get new_boat_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test 'should redirect update when logged in as non-admin user' do
    log_in_as(@user)
    patch boat_path(@boat), params: { boat: { name: 'Whatever',
                                              number: '69' } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete boat_path(@boat)
    end
    assert_redirected_to login_url
  end
  
  test "non-logged in users should not have access to boats" do
    get boats_path
    assert_redirected_to login_url
    get boat_path(@boat)
    assert_redirected_to login_url
    get edit_boat_path(@boat)
    assert_redirected_to login_url
    get new_boat_path
    assert_redirected_to login_url
  end
end
