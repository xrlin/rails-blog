class Admin::PostsController < Admin::ApplicationController
  def create
    post = Post.new(posts_params)
    post.save ? head(:created) : head(:bad_request)
  end

  private
    def posts_params
      params.permit(:title, :body)
    end
end
