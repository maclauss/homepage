require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:surenot)
    @post = @user.posts.build(title: "Lorem post", content: "Lorem ipsum")
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "should be destroyed with associated user" do
    @user.save
    @post.save
    post_count = Post.where(user_id: @user.id).count
    assert_difference 'Post.count', -post_count do
      @user.destroy
    end
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
  
end
