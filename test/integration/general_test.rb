require 'test_helper'

class GeneralTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:david)
  end
  
  test 'user actions should update the last activity date' do
    log_in_as(@user)
    # do anything
    get plans_path
    @user.reload
    # this might fail once in a while if the minute happens to change
    assert_equal Time.zone.now.strftime('%m-%d-%Y %H:%M'), @user.last_activity_date.strftime('%m-%d-%Y %H:%M')
  end
end
