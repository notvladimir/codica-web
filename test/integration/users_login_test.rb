require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:angela)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { login_name: @user.login_name,
                                          password: 'P@ssw0rd' } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'home/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
  end
end
