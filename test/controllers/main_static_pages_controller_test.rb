require 'test_helper'

class MainStaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Motley-Crew"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Motley-Crew"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Motley-Crew"
  end

end
