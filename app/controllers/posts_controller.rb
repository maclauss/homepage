class PostsController < ApplicationController
  before_action :redirect_unless_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_unless_admin,     only: [:new, :create, :edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build if logged_in?
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end