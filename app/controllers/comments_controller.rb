class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if logged_in?
      @comment.user_id = current_user.id
    end
    if @comment.save
      flash[:success] = "Comment created!"
    end
    redirect_to post
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to comment.post
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
