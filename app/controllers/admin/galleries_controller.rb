class Admin::GalleriesController < Admin::BaseController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def create
    slides_attributes = gallery_params["slides_attributes"]
    gallery_params_new = gallery_params
    gallery_params_new.delete :slides_attributes
    @gallery = Gallery.new(gallery_params_new)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully created.' }
        gallery_params_new["slides_attributes"] = slides_attributes
        @gallery.update gallery_params_new
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Gallery.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_galleries_url, notice: 'Galleries were successfully destroyed.'
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(
        :name,
        :gallery_type,
        :shortcode,
        slides_attributes: [:id, :gallery_id, :order, :slide_type, :image, 
                  :embedded_url, :thumb_text, :image_cache, :_destroy]
      )
    end
end
