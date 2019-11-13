require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:angela)
  end

  test "unsuccessful edit" do
  	get root_path
  	log_in_as(@user)
    get edit_user_path(@user)
    #assert_template 'users/edit'
    #patch user_path(@user), params: { user: { login_name:  "",
    #                                          password:              "Pppp",
    #                                          password_confirmation: "Ffff" } }

    #assert_template 'users/edit'
    
  end

  test "successful edit" do
  	get root_path
  	log_in_as(@user)
    get edit_user_path(@user)
    #assert_template 'users/edit'
    #login_name  = "AngelaG"

    #patch user_path(@user), params: { user: { login_name:  login_name,
    #                                          password:              "",
    #                                          password_confirmation: "" } }
    #assert_not flash.empty?
    #assert_redirected_to @user
    #@user.reload
    #assert_equal login_name,  @user.login_name
    
  end
  
end
