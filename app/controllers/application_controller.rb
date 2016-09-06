class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories

  private
    def set_categories
      # set the @categories instance varible
      @categories = Category.all
    end

end
