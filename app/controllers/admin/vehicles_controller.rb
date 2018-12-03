class Admin::VehiclesController < Admin::BaseController
  before_action :set_vehicle, only: [:edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to admin_vehicles_url, notice: 'Vehicle was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to admin_vehicles_url, notice: 'Vehicle was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to admin_vehicles_url, notice: 'Vehicle was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Vehicle.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_vehicles_url, notice: 'Vehicles were successfully destroyed.'
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(
        :title,
        :slug,
        :visibility,
        :order,
        :make,
        :model,
        :transmission,
        :specification,
        :seating_capacity,
        :kit,
        :for_hire,
        :featured_image,
        :featured_image_cache,
        :manufacturer_logo,
        :manufacturer_logo_cache,
        :brochure,
        :brochure_cache,
        :remove_featured_image,
        :remove_manufacturer_logo,
        :remove_brochure,
        :gallery_id,
        :overview,
        :features,
        :specifications,
        :meta_description,
        :meta_keywords,
        related_vehicle_ids: []
      )
    end
end
