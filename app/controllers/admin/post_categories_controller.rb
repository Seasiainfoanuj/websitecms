class Admin::PostCategoriesController < Admin::BaseController
  before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  def index
    @post_categories = PostCategory.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @post_category = PostCategory.new
  end

  def edit
  end

  def create
    @post_category = PostCategory.new(post_category_params)

    respond_to do |format|
      if @post_category.save
        format.html { redirect_to admin_post_categories_url, notice: 'Post category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @post_category.update(post_category_params)

    respond_to do |format|
      if @post_category.update(post_category_params)
        format.html { redirect_to admin_post_categories_url, notice: 'Post category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_categories_url, notice: 'Post category was successfully destroyed.' }
    end
  end

  def bulk_destroy
    PostCategory.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_post_categories_url, notice: 'Post categories were successfully destroyed.'
  end

  private
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    def post_category_params
      params.require(:post_category).permit(:name, :slug, :parent_id)
    end
end
