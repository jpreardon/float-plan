require 'test_helper'

class BoatsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = 'Float Plan'
  end
 
  test "should get fleet page" do
    get boats_url
    assert_response :success
    assert_select 'title', "Fleet | #{@base_title}"
  end
end