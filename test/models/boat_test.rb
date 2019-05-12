require 'test_helper'

class BoatTest < ActiveSupport::TestCase
  
  test 'number required' do
    boat = Boat.create(name: 'The Good Foot')
    assert_not boat.valid?
  end
  
  test 'boat should be valid' do
    boat = Boat.create(number: '1')
    assert boat.valid?
  end
  
  test 'boat number should be unique' do
    boat = Boat.create(number: '1')
    assert boat.save
    dupe = Boat.create(number: '1')
    assert_not dupe.valid?
  end
  
  test 'boat number should be a number' do
    boat = Boat.create(number: 'One')
    assert_not boat.valid?
    boat = Boat.create(number: '1.1')
    assert_not boat.valid?
  end
end
