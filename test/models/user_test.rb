require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "Example",password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end


  test "username should be present" do    
    @user.username = " "    
    assert_not @user.valid?  
  end

  test "password should be present" do    
    @user.password = " "    
    assert_not @user.valid?  
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "username should be unique" do 
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length to" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
