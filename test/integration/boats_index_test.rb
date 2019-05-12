require 'test_helper'

class BoatsIndexTest < ActionDispatch::IntegrationTest
 
  def setup
    @admin = users(:david)
  end
  
  test 'index includes all boats' do
    log_in_as(@admin)
    get boats_path
    assert_template 'boats/index'
    Boat.all.each do |boat|
      assert_select 'a[href=?]', boat_path(boat)
    end
  end
end
