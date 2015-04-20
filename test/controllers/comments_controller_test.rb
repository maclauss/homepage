require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    @user = users(:surenot)
    @other_user = users(:archer)
    @post = posts(:one)
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
end