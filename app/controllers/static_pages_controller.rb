class StaticPagesController < ApplicationController

  def home
    @posts = Post.paginate(page: params[:page], :per_page => 10)
  end

  def about
  end
end
