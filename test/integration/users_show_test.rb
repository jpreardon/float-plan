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
end
