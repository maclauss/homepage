
require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @user = users(:surenot)
    @other_user = users(:archer)
    @post = posts(:one)
  end
  
  test "should show when not logged in" do
    get :show, id: @post.id
    assert_template 'posts/show'
  end
  
  test "should show when logged in" do
    log_in_as(@user)
    get :show, id: @post.id
    assert_template 'posts/show'
  end
end
