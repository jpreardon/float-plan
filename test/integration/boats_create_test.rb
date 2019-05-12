require 'test_helper'

class BoatsCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:david)
  end
  
  test 'invalid boat' do
    log_in_as(@admin)
    get new_boat_url
    assert_no_difference 'Boat.count' do
      post boats_path, params: { boat: {  name: 'Invalidity Squared',
                                          number: '' } }
    end
    assert_template 'boats/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors', count: 2
    # Boat one is already in the DB via fixtures
    assert_no_difference 'Boat.count' do
      post boats_path, params: { boat: {  name: 'Invalidity Squared',
                                          number: '1' } }
    end
    assert_template 'boats/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors', count: 2
  end
  
  test 'valid boat' do
    log_in_as(@admin)
    get new_boat_url
    assert_difference 'Boat.count', 1 do
      post boats_path, params: { boat: {  name: 'Validity Cubed',
                                          number: '2' } }
    end
    follow_redirect!
    assert_template 'boats/show'
    assert_select 'div.alert-success'
  end
end