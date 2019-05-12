require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = 'Float Plan'
    @user = users(:quint)
  end
  
  test "should get home" do
    get home_url
    assert_select 'h1', 'Welcome!'
    assert_select 'title', "#{@base_title}"
  end
  
  test "should get float plans" do
    log_in_as(@user)
    get float_plans_url
    assert_response :success
    assert_select 'title', "Float Plans | #{@base_title}"
  end
  
  test "should get new float plan" do
    log_in_as(@user)
    get float_plans_new_url
    assert_response :success
    assert_select 'title', "New Float Plan | #{@base_title}"
  end
  
  test 'no float plans for non-logged in users' do
    get float_plans_url
    assert_redirected_to login_url
    assert_not flash.empty?
    get float_plans_new_url
    assert_redirected_to login_url
    assert_not flash.empty?
  end
  
  test "debug dump shoud not appear on pages" do
    get home_url
    assert_select 'div[class=?]', 'debug_dump', false
  end

end