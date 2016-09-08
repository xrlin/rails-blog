class TagsController < ApplicationController
  def show
    tag = ActsAsTaggableOn::Tag.find_by_slug_or_id(params[:slug])
    @posts = Post.tagged_with(tag.name)
  end
end
