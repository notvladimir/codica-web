require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { login_name:  "",
                                         password:              "gggg",
                                         password_confirmation: "jjj",
                                         is_books_admin: true,
                                         is_group_admin: false } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { login_name:  "VladimirD",
                                         password:              "P@ssw0rd",
                                         password_confirmation: "P@ssw0rd",
                                         is_books_admin: true,
                                         is_group_admin: true } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
