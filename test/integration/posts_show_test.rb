
require 'test_helper'

class PostsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:surenot)
    @non_admin = users(:archer)
    @post = posts(:one)
  end
  
  test "show should display when not logged in" do
    get post_path(@post)
    assert_template 'posts/show'
  end
  
  test "show should display when logged in" do
    log_in_as(@non_admin)
    get post_path(@post)
    assert_template 'posts/show'
  end

  test "show should include edit and delete links when admin" do
    log_in_as(@admin)
    get post_path(@post)
    assert_template 'posts/show'
    assert_select 'a[href=?]', edit_post_path(@post), text: 'edit'
    assert_select 'a[href=?]', post_path(@post), text: 'delete',
                                                  method: :delete
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
  end

  test "show should not include edit and delete links when non admin" do
    log_in_as(@non_admin)
    get post_path(@post)
    assert_template 'posts/show'
    assert_select 'a', text: 'edit', count: 0
    assert_select 'a', text: 'delete', count: 0
  end
end
