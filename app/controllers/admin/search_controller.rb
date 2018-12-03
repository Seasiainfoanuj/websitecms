class Admin::SearchController < Admin::BaseController
  def index
    if params[:search].present?
      @pages = Page.search(params[:search])
      @posts = Post.search(params[:search])
      @vehicles = Vehicle.search(params[:search])
      @products = Product.search(params[:search])
      @users = User.search(params[:search])
      @galleries = Gallery.search(params[:search])

      @count = @pages.count + @posts.count + @vehicles.count + @products.length + @users.count + @galleries.count
    else
      @count = 0
    end
  end
end
