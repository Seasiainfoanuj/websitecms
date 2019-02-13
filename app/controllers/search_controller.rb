class SearchController < ApplicationController
  def index
    if params[:search].present?
      @pages = Page.search(params[:search]).where.not(visibility: :private, status: :draft)
      @posts = Post.search(params[:search]).where.not(visibility: :private, status: :draft)
      @vehicles = Vehicle.search(params[:search]).where.not(visibility: :private)
      @products = Product.search(params[:search]).where.not(visibility: :private)

      @count = @pages.count + @posts.count + @vehicles.count + @products.length
    else
      @count = 0
    end
  end
end
