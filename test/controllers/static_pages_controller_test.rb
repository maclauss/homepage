require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  def setup
    @admin = users(:surenot)
    @non_admin = users(:archer)
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | surenot.tk"
  end
  
  test "should redirect traffic when not logged in" do
    get :traffic
    assert_redirected_to login_url
  end
  
  test "should redirect traffic when non admin" do
    log_in_as(@non_admin)
    get :traffic
    assert_redirected_to root_url
  end
  
  test "should get traffic when admin" do
    log_in_as(@admin)
    get :traffic
    assert_response :success
    assert_select "title", "Traffic | surenot.tk"
  end

end
