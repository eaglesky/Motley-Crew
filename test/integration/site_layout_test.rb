require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

    test "layout links" do
    get root_path
    assert_template 'main_static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", signup_path
  end
end
