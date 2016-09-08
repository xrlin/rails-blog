class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_slug_or_id(params[:id])
  end

end
