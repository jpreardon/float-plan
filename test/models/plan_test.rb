require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  
  test 'boat required' do
    plan = Plan.create( skipper: User.create( first_name: 'j', 
                                              last_name: 'j', 
                                              email: 'jj@jj.com', 
                                              password: 'password', 
                                              password_confirmation: 'password'))
    assert_not plan.valid?
  end
  
  test 'skipper required' do
    plan = Plan.create( boat: Boat.create(number: '87'))
    assert_not plan.valid?
  end
  
  test 'plan should be valid' do
    plan = Plan.create( boat: Boat.create(number: '87'), 
                        skipper: User.create( first_name: 'j', 
                                              last_name: 'j', 
                                              email: 'jj@jj.com', 
                                              password: 'password', 
                                              password_confirmation: 'password'))
    assert plan.valid?
  end
end