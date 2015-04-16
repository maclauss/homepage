require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:surenot)
    # This code is not idiomatically correct.
    @post = @user.posts.build(title: "Lorem post", content: "Lorem ipsum")
  end
  
  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end
  
  test "title should be shorter than 141 characters" do
    @post.title = "a" * 141
    assert_not @post.valid?
  end
  
  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end
  
  test "order should be most recent first" do
    assert_equal Post.first, posts(:now)
  end
  
  test "associated posts should be destroyed" do
    @user.save
    @user.posts.first.save
    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end
  
end
