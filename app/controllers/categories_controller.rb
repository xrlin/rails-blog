class CategoriesController < ApplicationController

  helper_method :category

  def show
    @posts = category.posts
  end

  def category
    Category.find_by_slug_or_id params[:id]
  end

end
