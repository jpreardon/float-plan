require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:david)
    @user = users(:quint)
  end
  
  test 'admin should be able to delete a user' do
    log_in_as(@admin)
    get user_path(@user)
    assert_template 'users/show'
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
  end
  
  test 'admins should see edit/delete links' do
    log_in_as(@admin)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'a[href=?]', edit_user_path(@user), count: 1
    assert_select 'a[href=?]', user_path(@user), count: 1
  end
  
  test 'non-admins should not see edit/delete links' do
    log_in_as(@user)
    get user_path(@admin)
    assert_template 'users/show'
    assert_select 'a[href=?]', edit_user_path(@admin), count: 0
    assert_select 'a[href=?]', user_path(@admin), count: 0
  end
end
