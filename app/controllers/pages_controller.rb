class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:slug])
    @gallery = Gallery.find(@page.gallery_id) if @page && @page.gallery_id.present?

    respond_to do |format|
      if @page && @page.template.present?
        format.html
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
