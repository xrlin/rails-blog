module Api
  module V1
    class PostsController < Api::V1::ApplicationController

      before_action :authenticate_admin!, except: [:index]
      before_action :set_post, only: [:update, :destroy]

      def index
        # TODO Paginate posts
        render json: Post.all, status: :ok
      end

      def create
        Post.create!(post_params)
        head :ok
      end

      def update
        # Raise error when failed, and the exception will be catch by rescue_from
        if @post && @post.update_attributes!(post_params)
          head :ok
        end
      end

      def destroy
        @post.destroy
        head :ok
      end

      private
        def post_params
          params.require(:post).permit(:title, :body, :category_id, :tag_list)
        end

        def set_post
          @post ||= Post.find(params[:id])
        end
    end
  end
end
