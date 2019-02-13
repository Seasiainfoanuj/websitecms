class WelcomeController < ApplicationController

  def index
    @page = Page.find_by_slug('welcome')
    @gallery = Gallery.find(@page.gallery_id) if @page && @page.gallery_id.present?

    if @page
      render "pages/show"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def coasters
    @flag = true
  end

  def commuters
    @flag = true
  end

  def motorhomes
    @flag = true
  end

  def iveco_tonto
    @flag = true
  end

  def iveco_trakker
    @flag = true
  end

  def robots
  end

  private

    def custom_promotion
      @flag
    end

end
