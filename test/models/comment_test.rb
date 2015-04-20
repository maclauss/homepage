require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:surenot)
    @post = posts(:one)
    @comment = @post.comments.build(content: "Lorem ipsum", user_id: @user.id)
  end
  
  test "should be valid" do
    assert @comment.valid?
  end
  
  test "user id can be absent" do
    @comment.user_id = nil
    assert @comment.valid?
  end

  test "post id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end
end
