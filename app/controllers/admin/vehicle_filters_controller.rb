class Admin::VehicleFiltersController < Admin::BaseController
  before_action :set_vehicle_filter, only: [:edit, :update, :destroy]

  def index
    @vehicle_filters = VehicleFilter.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @vehicle_filter = VehicleFilter.new
  end

  def edit
  end

  def create
    @vehicle_filter = VehicleFilter.new(vehicle_filter_params)
    respond_to do |format|
      if @vehicle_filter.save
        format.html { redirect_to admin_vehicle_filters_url, notice: 'Vehicle filter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle_filter.update(vehicle_filter_params)
        format.html { redirect_to admin_vehicle_filters_url, notice: 'Vehicle filter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @vehicle_filter.destroy
    respond_to do |format|
      format.html { redirect_to admin_vehicle_filters_url, notice: 'Vehicle filter was successfully destroyed.' }
    end
  end

  def bulk_destroy
    VehicleFilter.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_vehicle_filters_url, notice: 'Vehicle filters were successfully destroyed.'
  end

  private
    def set_vehicle_filter
      @vehicle_filter = VehicleFilter.find(params[:id])
    end

    def vehicle_filter_params
      params.require(:vehicle_filter).permit(
        :parent_id,
        :title,
        :slug,
        :data_filter,
        :enabled,
        :position
      )
    end
end
