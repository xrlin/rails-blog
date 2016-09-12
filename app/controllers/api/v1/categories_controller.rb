module Api
  module V1
    class CategoriesController < Api::V1::ApplicationController

      before_action :authenticate_admin!

      def create
        Category.bulk_insert do |worker|
          params.require(:categories).each do |param|
            worker.add(param.permit(:name))
          end
        end
        head :ok
      end
    end
  end
end
