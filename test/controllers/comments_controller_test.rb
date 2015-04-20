require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    @user = users(:surenot)
    @other_user = users(:archer)
    @post = posts(:one)
    @comment = @post.comments.build(content: "Lorem ipsum")
  end
  
  test "should accept create when not logged in" do
    assert_difference 'Comment.count' do
      post :create, { post_id: @post.id, comment: { content: "Lorem ipsum" } }
    end
    assert_redirected_to @post
  end

  test "should accept create when logged in" do
    log_in_as(@user)
    assert_difference 'Comment.count' do
      post :create, { post_id: @post.id, comment: { content: "Lorem ipsum" } }
    end
    assert_redirected_to @post
  end
  
  test "should redirect destroy when not logged in" do
    @comment.save
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @post.comments.first
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    @comment.save
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @post.comments.first
    end
    assert_redirected_to root_url
  end
end