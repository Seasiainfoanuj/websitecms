class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find_by_slug(params[:slug])
    @gallery = Gallery.find(@vehicle.gallery_id) if @vehicle && @vehicle.gallery_id.present?

    respond_to do |format|
      if @vehicle
        format.html
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end

  def search
    if params[:vehicle_search].present?
      vehicles = Vehicle.search(params[:vehicle_search]).where.not(visibility: :private)
    else
      vehicles = Vehicle.where.not(visibility: :private)
    end

    vehicles = vehicles.where(for_hire: true) if params[:for_hire] == 'true'

    @vehicles = vehicles.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.js
    end
  end
end
