require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest

  def setup
    @admin      = users(:surenot)
    @non_admin  = users(:archer)
    @post       = posts(:one)
  end

  test "home as admin including pagination and delete links" do
    log_in_as(@admin)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'div.pagination'
    first_page_of_posts = Post.paginate(page: 1, :per_page => 10)
    first_page_of_posts.each do |post|
      assert_select 'a[href=?]', post_path(post), text: post.title
      assert_select 'a[href=?]', edit_post_path(post), text: 'edit'
      assert_select 'a[href=?]', post_path(post), text: 'delete',
                                                    method: :delete
    end
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
  end

  test "home as non-admin" do
    log_in_as(@non_admin)
    get root_path
    assert_select 'a', text: 'edit', count: 0
    assert_select 'a', text: 'delete', count: 0
  end
end
