class PostsController < ApplicationController
  def index
    @category = PostCategory.find_by_slug(params[:category]) if params[:category]

    if @category
      @posts = @category.posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find_by_slug(params[:slug])

    respond_to do |format|
      if @post
        format.html
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
