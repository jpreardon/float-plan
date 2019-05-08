require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:david)
    @other_user = users(:quint)
  end
  
  test 'unsuccessful edit' do
    # TODO: Coming later 2019-05-07 JPR
    #log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { first_name: '',
                                              last_name: '',
                                              email: 'invalid',
                                              password: 'blah',
                                              password_confirmation: 'bleh' } }
                                              
    assert_template 'users/edit'
    assert_select 'div#error_explanation li', count: 5
  end
  
  test 'successful edit' do
    # TODO: Coming later 2019-05-07 JPR
    #log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    @other_user.email = 'unique@email.net'
    patch user_path, params: { user: {  first_name: @other_user.first_name,
                                  last_name: @other_user.last_name,
                                  email: @other_user.email,
                                  password: '',
                                  password_confirmation: '' } }
    assert_not flash.empty?, "flash bitch"
    assert_redirected_to @user
    @user.reload
    assert_equal @other_user.first_name, @user.first_name
    assert_equal @other_user.last_name, @user.last_name
    assert_equal @other_user.email, @user.email
  end
    
end
