require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(login_name: "VladimirD", 
                     password: "P@ssw0rd", 
                     password_confirmation: "P@ssw0rd", 
                     is_books_admin: true, 
                     is_group_admin: true)
  end

  test "create user" do
    assert @user.valid?
  end

  test "login_name should be present" do
    @user.login_name = "     "
    assert_not @user.valid?
  end

  test "login_name should not be too long" do
    @user.login_name = "a" * 100
    assert_not @user.valid?
  end

  test "login_name should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
