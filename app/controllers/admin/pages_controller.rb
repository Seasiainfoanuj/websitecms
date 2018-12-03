class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:edit, :update, :destroy]

  def index
    @pages = Page.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    @page.status = "draft" unless @page.status

    if params[:publish]
      @page.status = "published"
      @page.published_on = Time.zone.now
    end

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_url, notice: 'Page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if params[:publish]
      @page.status = "published"
      @page.published_on = Time.zone.now
    end

    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_pages_url, notice: 'Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Page.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_pages_url, notice: 'Pages were successfully destroyed.'
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(
        :title,
        :slug,
        :template,
        :status,
        :visibility,
        :order,
        :content,
        :meta_description,
        :meta_keywords,
        :published_on,
        :author_id,
        :gallery_id
      )
    end
end
