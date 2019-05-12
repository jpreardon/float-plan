require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @other_user = users(:quint)
    @base_title = 'Float Plan'
  end
  
  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { first_name: @user.first_name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test 'should redirect edit when logged in as non-admin user' do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test 'should redirect update when logged in as non-admin user' do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { first_name: @user.first_name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test "should get crew page" do
    log_in_as(@user)
    get users_path
    assert_response :success
    assert_select 'title', "Crew | #{@base_title}"
  end
  
  test 'should redirect index when not logged in, or non-admin user' do
    get users_path
    assert_redirected_to login_url
  end
  
  test 'should redirect index when non-admin user' do
    log_in_as(@other_user)
    get users_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test 'should redirect destroywhen not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
  
  test 'should reirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
