class StoreController < ApplicationController
  def index
    @category = ProductCategory.find_by_slug(params[:category_slug])
    @root_slug = @category.root.slug

    if @category
      rows = %w[ title product_attributes.value ]

      terms = []
      search_params  = {}
      @search_output = []
      @attributes = []

      if params[:search].present?
        terms << params[:search]
        @search_output << "search terms: #{params[:search]}"
      end

      @category.custom_attributes.pluck(:name).uniq.each do |attribute|
        @attributes << attribute

        if params[attribute.downcase].present?
          terms << params[attribute.downcase]
          @search_output << "#{attribute.downcase}: #{params[attribute.downcase]}"
        end
      end

      terms.each_with_index do |term, index|
        search_params["search#{index}".to_sym] = "%#{term}%"
      end

      search = terms.map.with_index do |term, index|
        "(" + rows.map { |row| "#{row} like :search#{index}" }.join(" or ") + ")"
      end.join(" and ")

      if search_params.present?
        products = @category.products
                            .joins(:custom_attributes)
                            .where(search, search_params)
                            .group('products.id')
      else
        products = @category.products
      end

      @products = products.where.not(visibility: :private).paginate(page: params[:page], per_page: params[:per_page] || 5).order('title ASC')
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def show
    @category = ProductCategory.find_by_slug(params[:category_slug])
    @product = Product.find_by_slug(params[:product_slug])
    @gallery = Gallery.find(@product.gallery_id) if @product && @product.gallery_id.present?

    respond_to do |format|
      if @product
        format.html
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
