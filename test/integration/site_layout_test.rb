require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin      = users(:surenot)
    @non_admin  = users(:archer)
    @post       = posts(:one)
  end
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", edit_user_path(@non_admin), count: 0
    assert_select "a[href=?]", user_path(@non_admin), count: 0
    assert_select "a[href=?]", new_post_path, count: 0
    post login_path, session: { email: @non_admin.email, password: 'password' }
    follow_redirect!
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@non_admin)
    assert_select "a[href=?]", user_path(@non_admin)
    assert_select "a[href=?]", new_post_path, count: 0
    post login_path, session: { email: @admin.email, password: 'password' }
    follow_redirect!
    assert_select "a[href=?]", new_post_path
  end

end
