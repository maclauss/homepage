class StaticPagesController < ApplicationController
  before_action :redirect_unless_logged_in, only: :traffic
  before_action :redirect_unless_admin,     only: :traffic

  def home
    @posts = Post.paginate(page: params[:page], :per_page => 10)
  end

  def about
  end

  def traffic
    @connections = Connection.take(20)
  end
end
