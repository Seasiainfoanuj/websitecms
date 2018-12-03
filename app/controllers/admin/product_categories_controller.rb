class Admin::ProductCategoriesController < Admin::BaseController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @product_category.update(product_category_params)

    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_categories_url, notice: 'Product category was successfully destroyed.' }
    end
  end

  def bulk_destroy
    ProductCategory.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_product_categories_url, notice: 'Product categories were successfully destroyed.'
  end

  private
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:name, :slug, :parent_id)
    end
end
