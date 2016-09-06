class CategoriesController < ApplicationController

  helper_method :category

  def show
    @posts = category.posts
  end

  def category
    Category.find(params[:id])
  end

end
