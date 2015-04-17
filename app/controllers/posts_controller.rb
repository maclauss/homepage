class PostsController < ApplicationController
  before_action :redirect_unless_logged_in, only: [:create, :destroy]

  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
end