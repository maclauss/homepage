require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @other_user = users(:archer)
    @post = posts(:one)
  end

  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to login_url
  end

  test "should redirect new when not admin" do
    log_in_as(@other_user)
    get :new
    assert_redirected_to root_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post :create, post: { title: "Lorem ipsum", content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect create when not admin" do
    log_in_as(@other_user)
    assert_no_difference 'Post.count' do
      post :create, post: { title: "Lorem ipsum", content: "Lorem ipsum" }
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @post
    assert_redirected_to login_url
  end

  test "should redirect edit when not admin" do
    log_in_as(@other_user)
    get :edit, id: @post
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    assert_no_difference 'Post.count' do
      post :update, id: @post, post: { title: "Lorem ipsum", content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect update when not admin" do
    log_in_as(@other_user)
    assert_no_difference 'Post.count' do
      post :update, id: @post, post: { title: "Lorem ipsum", content: "Lorem ipsum" }
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not admin" do
    log_in_as(@other_user)
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to root_url
  end
end