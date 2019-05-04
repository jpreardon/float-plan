require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new( first_name: 'Joe',
                      last_name: 'Blow',
                      email: 'joe@blow.net',
                      password: 'sailboat',
                      password_confirmation: 'sailboat')
  end
  
  test 'should be valid' do
    assert @user.valid?
  end
  
  test 'first name should be present' do
    @user.first_name = '   '
    assert_not @user.valid?
  end
  
  test 'last name should be present' do 
    @user.last_name = '   '
    assert_not @user.valid?
  end
  
  test 'email should be present' do 
    @user.email = '   '
    assert_not @user.valid?
  end
  
  test 'first names should not be too long' do
    @user.first_name = 'n' * 21
    assert_not @user.valid?
  end
  
  test 'last names should not be too long' do
    @user.last_name = 'n' * 31
    assert_not @user.valid?
  end
  
  test 'email should not be too long' do
    @user.email = 'e' * 249 + '@ex.com'
    assert_not @user.valid?
  end
  
  test 'should accept valid email addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_us-ER@ex.amp.le.net fi.la@bar.jp m+k@some.co.uk]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test 'should reject invalid email addresses' do
    valid_addresses = %w[user@example,com USER_foo_COM A_us-ER@ex.amp.le. fi.la@bar_baz.jp m+k@some+co.uk]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be invalid"
    end
  end
  
  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test 'emails should be lowercase on save' do
    mixed_case_email = 'UsEr@EXAMPLE.cOm'
    @user.email = mixed_case_email
    @user.save
    assert_not_equal @user.reload.email, mixed_case_email
  end
  
  test 'password should not be blank' do
      @user.password = @user.password_confirmation = '   ' * 6
      assert_not @user.valid?
  end
  
  test 'password should have a minimum length' do
      @user.password = @user.password_confirmation = 'a' * 5
      assert_not @user.valid?
  end
end
