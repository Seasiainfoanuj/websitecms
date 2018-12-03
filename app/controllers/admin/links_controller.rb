class Admin::LinksController < Admin::BaseController
  before_action :set_link, only: [:edit, :update, :destroy]

  def index
    @links = Link.all.paginate(page: params[:page], per_page: params[:per_page] || 10).order(order: :asc)
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to admin_links_url, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to admin_links_url, notice: 'Link was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to admin_links_url, notice: 'Link was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Link.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_links_url, notice: 'Links were successfully destroyed.'
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url, :new_window, :order, :show_in_footer)
    end
end
