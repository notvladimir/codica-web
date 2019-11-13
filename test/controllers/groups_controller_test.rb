require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@user = users(:angela)
  end

  test "should get index" do
  	assert_not_nil @user
	  get root_path
	  log_in_as(@user)
  	assert is_logged_in?
    get groups_path
    #assert_response :success
  end

end
