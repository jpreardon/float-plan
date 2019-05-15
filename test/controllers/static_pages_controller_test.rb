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
  
  test "debug dump shoud not appear on pages" do
    get home_url
    assert_select 'div[class=?]', 'debug_dump', false
  end

end