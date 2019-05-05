require 'test_helper'

class UsersCreateTest < ActionDispatch::IntegrationTest
  
  test 'invalid signup' do
    get new_user_url
    assert_no_difference 'User.count' do
      post users_path, params: {  user: { first_name: ' ',
                                          last_name: ' ',
                                          mobile: ' ',
                                          email: ' ',
                                          skipper: '',
                                          admin: '',
                                          password: ' ',
                                          password_confirmation: ' ' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors', count: 8
  end
  
  test 'valid signup' do
    get new_user_url
    assert_difference 'User.count', 1 do
      post users_path, params: {  user: { first_name: 'Davey',
                                          last_name: 'Jones',
                                          mobile: '1234567890',
                                          email: 'dave@jones-lockers.com',
                                          skipper: '1',
                                          admin: '1',
                                          password: 'sailboat',
                                          password_confirmation: 'sailboat' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_select 'div.alert-success'
  end
end
