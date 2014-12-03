require 'test_helper'

class MainStaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", Constant.app_title
  end

end
