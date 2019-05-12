require 'test_helper'

class BoatsEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:david)
    @boat = boats(:wasp)
  end
  
  test 'unsuccesful edit' do
    log_in_as(@admin)
    get edit_boat_path(@boat)
    assert_template 'boats/edit'
    patch boat_path(@boat), params: { boat: { number: '' } }
    assert_template 'boats/edit'
    assert_select 'div#error_explanation li', count: 2
  end
  
  test 'successful edit' do
    number = '256'
    name = 'Ring-a-ding-ding'
    note = 'Sup?'
    log_in_as(@admin)
    get edit_boat_path(@boat)
    assert_template 'boats/edit'
    patch boat_path(@boat), params: { boat: { number: number,
                                              name: name,
                                              note: note } }
    assert_not flash.empty?
    assert_redirected_to @boat
    @boat.reload
    assert_equal number, @boat.number
    assert_equal name, @boat.name
    assert_equal note, @boat.note
  end
end