class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_url, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Product.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_products_url, notice: 'Products were successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :title,
        :slug,
        :price,
        :price_cents,
        :special_price,
        :special_price_cents,
        :quick_overview,
        :overview,
        :specifications,
        :sold,
        :visibility,
        :featured_image,
        :remove_featured_image,
        :gallery_id,
        :meta_description,
        :meta_keywords,
        custom_attributes_attributes: [:id, :product_id, :name, :value, :_destroy],
        category_ids: []
      )
    end
end
