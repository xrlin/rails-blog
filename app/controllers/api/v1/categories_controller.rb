module Api
  module V1
    class CategoriesController < Api::V1::ApplicationController

      # before_action :authenticate_admin!, except: [:index]
      before_action :set_category, only: [:update, :destroy]

      def index
        render json: Category.all, status: :ok
      end

      def create
        Category.create!(category_params)
        head :created
      end

      def update
        # Raise error when failed, and the exception will be catch by rescue_from
        if @category && @category.update_attributes!(category_params)
          head :ok
        end
      end

      def destroy
        @category.destroy
        head :ok
      end

      private
        def category_params
          params.require(:category).permit(:name)
        end

        def set_category
          @category ||= Category.find(params[:id])
        end
    end
  end
end
